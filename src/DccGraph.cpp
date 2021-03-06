/*
 * © 2020 Gregor Baues. All rights reserved.
 *
 * This is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * See the GNU General Public License for more details
 * <https://www.gnu.org/licenses/>
 */

#include "DccGraph.hpp"
#include "DccVertex.hpp"
#include "Diag.hpp"

auto DccGraph::checkModule(DccModel::Module *module) -> int {
  mn++; // each time called the number increases by one;
  module->set_dccid(mn);

  DBG("Module[{}]: {} using track plan {}", module->get_dccid(),
      module->get_name(), module->get_trackplan());
  // Check if there is a Trackplan for the module
  bool hasTp = false;
  for (auto tp : layout->get_trackplans()) {
    if (tp.get_name() == module->get_trackplan()) {
      INFO("Found track plan [{}] for Module [{}]", tp.get_name(),
           module->get_name());
      hasTp = true;
      tps.push_back(tp);
      modules.insert({module->get_name(), mn});
      break;
    }
  }
  if (!hasTp) {
    ERR("  No track plan for Module [{}] found", module->get_name());
    return 0;
  }
  return mn;
}

std::shared_ptr<DccVertex> DccGraph::createVertex(int16_t module, int32_t dccid,
                                                  Node_t nodeid,
                                                  TrackElement_t te) {

  std::shared_ptr<DccVertex> v =
      std::make_shared<DccVertex>(obtainNGid(), module, dccid, nodeid, te);

  auto nodeIt = nodes.find(v->getNodeid());
  if (nodeIt == nodes.end()) {
    nodes.insert(v->getNodeid());
  }
  // the vertex contains now the encoded nodeid;

  // add the vertex to the appropriate vector of vertices for this trackelement
  auto it = tev.find(dccid);
  // if the  vector exists just push the vertex into it otherwise create it and
  // the push it
  if (it == tev.end()) {
    tev.insert({dccid, std::vector<DccVertexPtr_t>()});
  }
  tev.at(dccid).push_back(v);
  graph.insert(std::pair<int64_t, DccVertexPtr_t>(v->getGid(), v));

  // figure out which trackelement type we got just ofr tracing purposes
  std::string type;
  switch (v->getTeType()) {
  case BUMPER: {
    type = "Bumper";
    break;
  }
  case TURNOUT: {
    type = "Turnout";
    break;
  }
  case RAIL: {
    type = "Rail";
    break;
  }
  case CROSSING: {
    type = "Crossing";
    break;
  }
  case JUNCTION: {
    type = "Junction";
    break;
  }
  }

  TRC("Created {} vertices: Module:[{}], TrackElement:[{}], PathId:[{}]", type,
      v->getModule(), v->getDccid(), v->getNodeid());
  return v;
}

/**
 * @brief Creates a vertex for a Bumper and inserts it into the graph
 *
 * @param mn Module number
 * @param ten Trackelement number
 * @param te Address of the Trackelement (from the model )
 */
void DccGraph::buildBumperVertex(int mn, int ten, DccModel::Trackelement *te) {
  DBG("Bumper[{}] {}", te->get_dccid(),
      te->get_bumper().get()->get_description() == nullptr
          ? ""
          : te->get_bumper().get()->get_description().get()->c_str());
  // creates one vertex
  Node_t vid = te->get_bumper().get()->get_path();
  createVertex(mn, ten, vid, te->get_bumper());
}

void DccGraph::buildTurnoutVertex(int mn, int ten, DccModel::Trackelement *te) {
  // creates three vertices

  DBG("Turnout[{}] {}", te->get_dccid(),
      te->get_turnout().get()->get_description() == nullptr
          ? ""
          : te->get_turnout().get()->get_description().get()->c_str());
  // vertex for the narrow end
  Node_t vid = te->get_turnout().get()->get_narrow();
  DccVertexPtr_t narrow = createVertex(mn, ten, vid, te->get_turnout());

  // vertices for the wide end
  for (Node_t vid : te->get_turnout().get()->get_wide()) {
    DccVertexPtr_t wide = createVertex(mn, ten, vid, te->get_turnout());
    DBG("Adding narrow [{}] to wide [{}] connection",  narrow.get()->getNodeid(), wide.get()->getNodeid()); 
    wide.get()->addConnection(narrow);
    DBG("Adding wide [{}] to narrow [{}] connection", wide.get()->getNodeid(), narrow.get()->getNodeid());
    narrow.get()->addConnection(wide);
  };

  INFO("Turnout <T {}{} {}>", mn, vid, ten);
}

void DccGraph::buildRailVertex(int mn, int ten, DccModel::Trackelement *te) {
  // creates two vertices
  DBG("Segment[{}] {}", te->get_dccid(),
      te->get_rail().get()->get_description() == nullptr
          ? ""
          : te->get_rail().get()->get_description().get()->c_str());
  if (te->get_rail().get()->get_path().size() > 2) {
    ERR("Segment has more than {} nodes", 2);
  } else {
    Node_t v1 = te->get_rail().get()->get_path().at(0);
    DccVertexPtr_t in = createVertex(mn, ten, v1, te->get_rail());
    Node_t v2 = te->get_rail().get()->get_path().at(1);
    DccVertexPtr_t out = createVertex(mn, ten, v2, te->get_rail());
    DBG("Adding out [{}] to in [{}] connection", out.get()->getNodeid(), in.get()->getNodeid());
    in.get()->addConnection(out);
    DBG("Adding in [{}] to out [{}] connection", in.get()->getNodeid(), out.get()->getNodeid());
    out.get()->addConnection(in);
    length = length + te->get_rail().get()->get_length();
  }
}

void DccGraph::buildCrossingVertex(int mn, int ten,
                                   DccModel::Trackelement *te) {

  DccVertexPtr_t in;
  DccVertexPtr_t out;
  std::vector<DccVertexPtr_t> crNodes;

  // creates two vertices
  DBG("Crossing [{}] {}", te->get_dccid(),
      te->get_crossing().get()->get_description() == nullptr
          ? ""
          : te->get_crossing().get()->get_description().get()->c_str());
  if (te->get_crossing().get()->get_path().size() != 4) {
    ERR("Crossing hasn't the required set of nodes ({})", 4);
  } else {
    // create vertices for the crossing
    DBG("Create [{}] vertices for the crossing",
        te->get_crossing().get()->get_path().size());
    for (unsigned long i = 0; i < te->get_crossing().get()->get_path().size();
         i++) {
      Node_t v = te->get_crossing().get()->get_path().at(i);
      crNodes.push_back(createVertex(mn, ten, v, te->get_crossing()));
    }
    // add connections i = 0 = top left of the crossing
    // straight connections
    spdlog::debug("Adding connections between the vertices of the crossing");
    for (int i = 0; i < 2; i++) {
      in = crNodes.at(i);
      out = crNodes.at(i + 2);
      // DBG("Adding out [{}] to in [{}] connection", out.get()->getNodeid(),
       //   in.get()->getNodeid());
      in.get()->addConnection(out);
      // DBG("Adding in [{}] to out [{}] connection", in.get()->getNodeid(),
      //     out.get()->getNodeid());
      out.get()->addConnection(in);
    }
    // add slips if any; none -> just a crossing
    if (te->get_crossing().get()->get_slip().size() > 0) {
      // DBG("Adding [{}] slips to the connections between the vertices of the "
      //     "crossing",
      //     te->get_crossing().get()->get_slip().size());
      // loop over all slips
      for (unsigned long i = 0; i < te->get_crossing().get()->get_slip().size();
           i++) {
        // find the vertex for the first slip point in crNodes based on the
        // index
        unsigned long j = 0;
        for (j = 0; j < te->get_crossing().get()->get_path().size(); j++) {
          if (crNodes.at(j).get()->getNodeid() ==
              te->get_crossing().get()->get_slip().at(i)) {
            in = crNodes.at(j);
            break;
          }
        }

        // DBG("Found first j [{}] i [{}]", j, i);
        // find the opposite for the slip point; As the user can define any node
        // as the start/end of the slip look for the direction
        if (j == 0 || j == 2) {
          j++;
        } else {
          j--;
        }
        // DBG("Found second j [{}] i [{}]", j, i);
        out = crNodes.at(j);

        // DBG("Adding out [{}] to in [{}] connection", out.get()->getNodeid(),
         //   in.get()->getNodeid());
        in.get()->addConnection(out);
        // DBG("Adding in [{}] to out [{}] connection", in.get()->getNodeid(),
         //   out.get()->getNodeid());
        out.get()->addConnection(in);
      }
    }
  }
}

/**
 * @brief Builds the entire Graph object for a module.
 *
 * @param moduleNumber
 */
void DccGraph::buildGraph(int mn) {
  // vector index starts at 0 but we number the modules starting at 1
  DccModel::Trackplan tp = tps.at(mn - 1);

  tp.set_dccid(tpn);
  tpn++;

  INFO("Building TrackPlan[{}]: {}", tp.get_dccid(), tp.get_name());

  /**
   * @todo error checking on the contents of the layout if not caught before by
   * the validator
   *
   */

  for (auto ts : tp.get_tracksections()) {
    ts.set_dccid(tsn);
    tsn++;
    DBG("TrackSection[{}]: {}", ts.get_dccid(), ts.get_name());
    for (auto te : ts.get_trackelements()) {
      te.set_dccid(ten);
      if (te.get_bumper()) {
        buildBumperVertex(mn, ten, &te);
        bn++;
      }
      if (te.get_turnout()) {
        buildTurnoutVertex(mn, ten, &te);
        tn++;
      }
      if (te.get_rail()) {
        buildRailVertex(mn, ten, &te);
        sn++;
      }
      if (te.get_crossing()) {
        buildCrossingVertex(mn, ten, &te);
        cn++;
      }
      ten++;
    }
  }
}

/**
 * @brief Builds the graph object for the layout based on the modules present
 *
 * @param l  reference to the layout as parsed from the layouts json file
 */
void DccGraph::build(DccModel::DccExLayout *l) {
  // Read all modules and check if there is a trackplan for each module
  // as there may be more trackplans in there as are used by modules collect the
  // used ones in a vector
  INFO("Setting up Modules ... ");
  layout = l;
  for (auto module : layout->get_modules()) {
    int mn = checkModule(
        &module); // get back the module number for the last checked module
    if (mn > 0) { // if it's 0 we don't have a trackplan for this module
      buildGraph(mn);
    }
  }

  int jn = 0;

  if (layout->get_junctions() != nullptr) {
    jn = layout->get_junctions().get()->size();
    INFO("Setting up [{}] Junctions ... ", jn);
  }

  // for each junction build a rail segement out of thin air ..
  // one vertex for m1 with from path
  // one vertex for m2 with to path
  // connect them together like in buildRailVertex ()
  // when building the siblings ie double vertices they shall be picked up
  // if there are bumpers we will have to many siblngs so dump the bumper
  // if there are no siblings for the connecting node add this one to it

  for (int i = 0; i < jn; i++) {

    TrackElement_t j = std::make_shared<DccModel::Junction>(
        layout->get_junctions().get()->at(i));

    // dccid and the trackelement doesn't exists
    // ten++; // to be set as dccid for the rail same for the second vertex
    // the track element is to be the junction object!

    auto from =
        std::get_if<std::shared_ptr<DccModel::Junction>>(&j)->get()->get_from();
    auto to =
        std::get_if<std::shared_ptr<DccModel::Junction>>(&j)->get()->get_to();

    TRC("Creating Junction #{} from [{} : {}] to [{} : {}]", i,
        from.get_from_module(), from.get_path(), to.get_to_module(),
        to.get_path());

    int mn1 = 0;
    int mn2 = 0;

    DccVertexPtr_t in;
    DccVertexPtr_t out;

    bool isJunction1 = false;
    bool isJunction2 = false;

    auto itf =
        modules.find(from.get_from_module()); // that gives me the name -> find
                                              // the module number
    if (itf != modules.end()) {
      mn1 = modules.find(from.get_from_module())->second;
      in = createVertex(mn1, ten, from.get_path(), j);
      isJunction1 = true;
    } else {
      ERR("No Module [{}] found for Junction node [{}]", from.get_from_module(),
          from.get_path());
      isJunction1 = false;
    }

    auto itt = modules.find(
        to.get_to_module()); // that gives me the name -> find the module number
    if (itt != modules.end()) {
      mn2 = modules.find(to.get_to_module())->second;
      out = createVertex(mn2, ten, to.get_path(), j);
      isJunction2 = true;
    } else {
      ERR("No Module [{}] found for Junction node [{}]", to.get_to_module(),
          to.get_path());
      isJunction2 = false;
    }
    if (isJunction1 && isJunction2) {
      DBG("Adding junction out [{}] to in [{}] connection", out.get()->getNodeid(), in.get()->getNodeid());
      in.get()->addConnection(out);
      DBG("Adding junction in [{}] to out [{}] connection", in.get()->getNodeid(), out.get()->getNodeid());
      out.get()->addConnection(in);
      ten++;
    }
    // length = length + te->get_rail().get()->get_length(); / do we have to
    // care about the length ??
  }

  // in tps we have now all the trackplans used by the layout
  // and in graph all vertices ready to be combined together into the double
  // vertices there is a double vertice for each of the trackelements; loop over
  // the track element number (ten) and get the vertices out of graph which have
  // the same nodeid eq to the current track element number;
  DBG("Building Double Vertices for [{}] nodes", nodes.size());
  for (auto i : nodes)
  // for (int32_t i = 1; i <= getNumberOfNodes(); i++)
  {

    auto dv = std::shared_ptr<DccDoubleVertex>(new DccDoubleVertex());
    auto siblings = dv.get()->getSiblings();

    TRC("Searching siblings for nodeid [{}]", i);

    for (auto v : graph) {
      auto vptr = v.second;
      if (vptr.get()->getNodeid() == i) {
        // Tell the vertex which dv it is part of; allows to navigate from one
        // Dv to the next based on the connections of one of the siblings
        vptr.get()->setDv(dv);
        siblings->push_back(vptr);
      }
    }
    DBG("Size [{}]", siblings->size());
    bool addSiblings = false;
    int sib0 = 0; // defaults if everything is ok i.e. there are two siblings
    int sib1 = 1;
    switch (siblings->size()) {
    case 0: {
      // not connected at all - can be ignored
      WARN("WARNING: No siblings for nodeid [{}]: Node is (maybe "
           "intentionally) not connected/skipped in the track plan",
           i);
      break;
    }
    case 1: {
      // End of track i.e. Bumper ommitted most likely
      WARN("WARNING: Missing sibling for nodeid [{}]: Bumper or connection is "
           "missing",
           i);
      break;
    }
    case 2: {
      addSiblings = true;
      break;
    }
    case 3: {
      // this happens when we have a junction and a bumper on the same node id
      // or any other error in linking nodes just like the deafult case
      // ignore the Bumper and replace it by the junction
      // remove the bumper from the siblings ( costly though but no other
      // solution yet ) remove the bumper
      WARN("WARNING: Possible reconfiguration from a bumper to a junction "
           "sibling for nodeid [{}]",
           i);
      for (size_t i = 0; i < siblings->size(); i++) {
        DBG("Found sibling #{} of type {}", i,
            siblings->at(i).get()->getTrackElementType());
        switch (siblings->at(i).get()->getTeType()) {
        case BUMPER: {
          WARN("WARNING: Bumper has been deleted and replaced by a junction");
          siblings->erase(siblings->begin() + i);
          break;
        }
        default: {
          // don't do anything
        }
        }
      }
      // Size should be ok now if there was a bumper
      if (siblings->size() <= 2) {
        addSiblings = true;
        break;
      }
    }
    default: {
      addSiblings = true;
      WARN("Too many siblings for nodeid [{}]; ignoring the additional "
           "siblings ",
           i);
    }
    }

    if (addSiblings) {
      int64_t id1 = siblings->at(sib0).get()->getGid();
      int64_t id2 = siblings->at(sib1).get()->getGid();
      TRC("DV siblings {}", dv.get()->getSiblings()->size());
      dvGraph.insert({std::pair(id1, id2), dv});
    }
  }

  TRC("DVGraph has [{}] nodes", dvGraph.size());
  _isBuild = true;
}

void DccGraph::printGraph() {
  INFO("-----------------------------------------");
  INFO("Printing Graph:");
  INFO("-----------------------------------------");
  for (auto mapItem : graph) {
    DccVertexPtr_t v = mapItem.second;
    v.get()->printVertex();
  }
}

void DccGraph::printTrackElements() {
  INFO("-----------------------------------------");
  INFO("Track Elements");
  INFO("-----------------------------------------");
  for (auto te : tev) {
    INFO("TrackElement[{}] contains ", te.first);
    for (auto t : te.second) {
      t.get()->printVertex();
    }
  }
}

void DccGraph::printInfo() {

  Diag::push();
  Diag::setPrintLabel(false);

  INFO("-----------------------------------------");
  INFO("Layout info");
  INFO("-----------------------------------------");
  INFO("Name: {} has", layout->get_layout().get_name());
  INFO("{} Modules using", mn);

  for (auto m : layout->get_modules()) {

    INFO("  Trackplan [{}] for Module [{}]", m.get_trackplan(), m.get_name());
  }

  INFO("{} has overall:", layout->get_layout().get_name());
  INFO("{} Turnouts", tn);
  INFO("{} Segments", sn);
  INFO("{} Bumpers", bn);
  INFO("{} Crossings", cn);
  DBG("{} Trackelements", ten);
  DBG("# Total number of nodes: {}", nodes.size());
  INFO("Track length: {}", length);
  DBG("# ngid: {}", ngid);

  Diag::pop();
}