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

#ifndef DccPathFinder_h
#define DccPathFinder_h

#include "DccGraph.hpp"
#include "DccPath.hpp"
#include "DccModel.hpp"
#include "DccVertex.hpp"


class DccPathFinder {
private:
  DccGraph  *_graph;
  DccPath   *_path;

  int32_t   _start;
  int32_t   _end;
  bool      isCalculated = false;

  void DFS(DccPath_t path, DccVertexPtr_t start);
  void DFS(DccPath_t path, DccVertexPtr_t start, int32_t end);


  void findAllPaths(int32_t start,
                    int32_t end); // find all paths between two nodes
  void
  findAllRail2RailPaths(); // find all paths between any two rail segment nodes
  void findAllPaths(int32_t nodeid); // Expolore all paths from a given node

public:

  // to be called to setup all the paths for the layout
  void calculate();


  DccPathFinder(DccGraph *graph, DccPath *p);
  ~DccPathFinder() = default;
};

#endif