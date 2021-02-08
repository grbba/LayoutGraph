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

#include "DccConfig.hpp"
#include "../include/CLI11.hpp"

std::string DccConfig::dccLayoutFile;
std::string DccConfig::dccSchemaFile = CONFIG_DCCEX_SCHEMA;
bool DccConfig::isInteractive = CONFIG_INTERACTIVE;
bool DccConfig::fileInfo = CONFIG_FILEINFO;
DiagLevel DccConfig::level =
    DiagLevel::LOGV_WARN; // by default show everything up to Warning level

auto DccConfig::setup(int argc, char **argv) -> int {

  CLI::App app{"DCC++ EX Layout Generator Help"};

  app.get_formatter()->label("REQUIRED", "(mandatory)");
  app.get_formatter()->column_width(40);

  app.add_option("-s,--schema", dccSchemaFile,
                 "path/name of the DCC++ EX Layout Schema file. If this file "
                 "is omitted we will\nlook for the the schema file in the "
                 "current directory. If not found the system will \ncontinue "
                 "but no validation of the layout will be done and this may "
                 "yield \nunpredictable results")
      ->check(CLI::ExistingFile);

  app.add_option("-l,--layout", dccLayoutFile,
                 "path/name of the modelrailroad layout file")
      ->required()
      ->check(CLI::ExistingFile);

  app.add_option(
      "-c,--commandstation", dccLayoutFile,
      "IP address provided as e.g. 10.102.200.45 of the DCC++ EX "
      "commandstation. If the\nIP address is provided commands for creating "
      "Turnouts, Accessories etc. will be send to \nthe commandstation if we "
      "can connnect to it.\nCommandstation Version 3.0.1 is required");

  app.add_option("-v,--verbose", level, "Verbose settings")
      ->transform(
          CLI::CheckedTransformer(Diag::getDiagMap(), CLI::ignore_case));

  app.add_flag("-i,--interactive", DccConfig::isInteractive,
               "Interactive mode; Opens a shell from which commands can be "
               "issued type --help for more info");

  // CLI11_PARSE(app, argc, argv);
  try {
    (app).parse((argc), (argv));
  } catch (const CLI::ParseError &e) {
        (app).exit(e);
        return DCC_FAILURE;
  }

  Diag::setLogLevel(
      level); // if not set via the commandline by default set to WARN
  Diag::setFileInfo(
      fileInfo); // if not set via commandline by default set to false

  return DCC_SUCCESS;
}