/*
 * © 2021 Gregor Baues. All rights reserved.
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
/**
 * @brief ShellCmdConfig List of all commands to insert
 * @note n/a
 * @author grbba
 */

#include <nlohmann/json.hpp>

const std::string rootMenuItems = R"(
  {
    "Commands" :
    [
      {
        "name": "config",
        "params": [],
        "help": [ "Shows the configuration items for the current session" ]
      }
    ]
  }
)";



// Commandstation Menu
const std::string csMenuItems = R"(
  {
    "Commands": [
      {
        "name": "open",
        "params": 
        [
          { "type": "string", "desc": "serial|ethernet", "mandatory": 1 },
          { "type": "string", "desc": "serial port|ip address", "mandatory": 1 },
          { "type": "integer", "desc": "baud", "mandatory": 0 }
        ],
        "help": [ 
            "open <serial|ethernet> <port> <baud>; If serial indicate the used USB",
            "\tport and for ethernet indicate the IP address of the commandstation",
            "\tbaud will be ignored for ethernet and, if not specified for serial,",
            "\tthe default of 115200 will be used."
        ]
      },
      {
        "name":"status",
        "params": [],
        "help" :[ "Requesting status from the commandstation" ]
      },
      {
        "name":"read",
        "params": [
          { "type": "integer", "desc": "cv", "mandatory": 1 },
          { "type": "integer", "desc": "callbacknum", "mandatory": 0 },
          { "type": "integer", "desc": "callbacksub", "mandatory": 0 }
        ],
        "help" :[ "Reading CV. Allowed values for cv are 1 to 1024" ]
      },
      {
        "name":"diag",
        "params": [
          { "type": "string", "desc": "[ack|wifi|ethernet|cmd|wit]", "mandatory": 1 },
          { "type": "string", "desc": "[on|off]", "mandatory": 1 }
        ],
        "help" :[ "Enable/Disbale diganostics for the commandstation" ]
      }
      ]
  }
)";