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



#include <fstream>
#include <iostream>
#include <string>

#include "DccConfig.hpp"
#include "DccGraph.hpp"
#include "DccPathFinder.hpp"
#include "Diag.hpp"

#include "DccLayout.hpp"

using nlohmann::json;
using nlohmann::json_schema::json_validator;

auto DccLayout::readLayout() -> int {

  INFO("Reading & validating DccExLayout schema ...");

  std::ifstream layoutFile(DccConfig::dccLayoutFile);
  std::ifstream schemaFile(DccConfig::dccSchemaFile);

  if (!layoutFile.is_open()) {
    ERR("Layout file {} not found", DccConfig::dccLayoutFile);
    return DCC_FAILURE;
  }
  if (!schemaFile.is_open()) {
    WARN("Schema file {} not found. Trying to use the default DccEXLayout "
         "schema file",
         DccConfig::dccSchemaFile);
  }

  try {
    schemaFile >> schema;
  } catch (const std::exception &e) {
    ERR("Validation of schema failed: {}", e.what());
    ERR("Validation failed at: [{}] while parsing schema", schemaFile.tellg());
    return DCC_FAILURE;
  }

  INFO("Initalizing DccExLayout schema for layout parsing ...");
  try {
    validator.set_root_schema(schema); // insert root-schema
  } catch (const std::exception &e) {
    ERR("Schema initalization failed: {}", e.what());
    return DCC_FAILURE;
  }

  INFO("Validating layout description ... ");
  json document;
  try {
    layoutFile >> document;
  } catch (const std::exception &e) {

    ERR("Validation failed at: [{}] while parsing layout", schemaFile.tellg());
    return DCC_FAILURE;
  }

  try {

    validator.validate(document);
  } catch (const std::exception &e) {
    ERR("Validation of parsed layout failed: {}", e.what());
    return DCC_FAILURE;
  }

  INFO("Loading layout description ... ");

  // reset to start position of the file as it was read before for the
  // Validation step

  layoutFile.seekg(0);

  try {
    layout = nlohmann::json::parse(layoutFile);
  } catch (json::parse_error &e) {
    ERR("Loading of the layout failed: {}", e.what());
    return DCC_FAILURE;
  }

  layoutFile.close();
  schemaFile.close();

  return DCC_SUCCESS;
}

auto DccLayout::build() -> int {

  if (!readLayout()) {
    ERR("Layout Model build failed cf. previous errors");
    return DCC_FAILURE;
  };

  INFO("Generating Layout graph... : {}", layout.get_layout().get_name());
  INFO("{} has {} module(s)", layout.get_layout().get_name(),
       layout.get_modules().size());

  DccPathFinder gpf(&graph, &path); // setup the Pathfinder for the graph g -> to be
                                    // inialized after the graph has been build as well as the path object to hold the results

  auto start = std::chrono::high_resolution_clock::now();

  // feed the layout into the graph builder
  graph.build(&layout);
  

  /**
   * @todo this should be a function in the graph object to be called
   * 
   */
  for (auto var : *graph.getDvGraph()) {
    var.second.get()->printDoubleVertex();
  }

  auto stop = std::chrono::high_resolution_clock::now();
  auto duration =
      std::chrono::duration_cast<std::chrono::milliseconds>(stop - start);

  INFO("Generating Paths ...");

  gpf.calculate();

  INFO("Elapsed time: [{}]ms", duration.count());

  return DCC_SUCCESS;
}

void DccLayout::listPaths() {
  Diag::push();
  Diag::setPrintLabel(false);

  CLI_INFO;
  fmt::print("Printing ALL {} paths available for this Layout\n", path.getNumberOfPaths());

  const auto start = path.getAllPaths()->begin();    
  const auto end = path.getAllPaths()->end();
  for (auto it = start; it != end; ++it) {
    path.printPathsByNode(it->first);
  }

  Diag::pop();
}

void DccLayout::info() {
    graph.printInfo();
}
