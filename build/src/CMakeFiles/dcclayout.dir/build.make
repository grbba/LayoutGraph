# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.19.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.19.5/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/gregor/Projects/DccEX-CLI

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/gregor/Projects/DccEX-CLI/build

# Include any dependencies generated for this target.
include src/CMakeFiles/dcclayout.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/dcclayout.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/dcclayout.dir/flags.make

src/CMakeFiles/dcclayout.dir/main.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/dcclayout.dir/main.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/main.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/main.cpp

src/CMakeFiles/dcclayout.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/main.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/main.cpp > CMakeFiles/dcclayout.dir/main.cpp.i

src/CMakeFiles/dcclayout.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/main.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/main.cpp -o CMakeFiles/dcclayout.dir/main.cpp.s

src/CMakeFiles/dcclayout.dir/Diag.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/Diag.cpp.o: ../src/Diag.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/dcclayout.dir/Diag.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/Diag.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/Diag.cpp

src/CMakeFiles/dcclayout.dir/Diag.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/Diag.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/Diag.cpp > CMakeFiles/dcclayout.dir/Diag.cpp.i

src/CMakeFiles/dcclayout.dir/Diag.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/Diag.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/Diag.cpp -o CMakeFiles/dcclayout.dir/Diag.cpp.s

src/CMakeFiles/dcclayout.dir/DccVertex.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccVertex.cpp.o: ../src/DccVertex.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/dcclayout.dir/DccVertex.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccVertex.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccVertex.cpp

src/CMakeFiles/dcclayout.dir/DccVertex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccVertex.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccVertex.cpp > CMakeFiles/dcclayout.dir/DccVertex.cpp.i

src/CMakeFiles/dcclayout.dir/DccVertex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccVertex.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccVertex.cpp -o CMakeFiles/dcclayout.dir/DccVertex.cpp.s

src/CMakeFiles/dcclayout.dir/DccGraph.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccGraph.cpp.o: ../src/DccGraph.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/dcclayout.dir/DccGraph.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccGraph.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccGraph.cpp

src/CMakeFiles/dcclayout.dir/DccGraph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccGraph.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccGraph.cpp > CMakeFiles/dcclayout.dir/DccGraph.cpp.i

src/CMakeFiles/dcclayout.dir/DccGraph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccGraph.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccGraph.cpp -o CMakeFiles/dcclayout.dir/DccGraph.cpp.s

src/CMakeFiles/dcclayout.dir/DccPathFinder.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccPathFinder.cpp.o: ../src/DccPathFinder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/dcclayout.dir/DccPathFinder.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccPathFinder.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccPathFinder.cpp

src/CMakeFiles/dcclayout.dir/DccPathFinder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccPathFinder.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccPathFinder.cpp > CMakeFiles/dcclayout.dir/DccPathFinder.cpp.i

src/CMakeFiles/dcclayout.dir/DccPathFinder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccPathFinder.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccPathFinder.cpp -o CMakeFiles/dcclayout.dir/DccPathFinder.cpp.s

src/CMakeFiles/dcclayout.dir/DccLayout.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccLayout.cpp.o: ../src/DccLayout.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/dcclayout.dir/DccLayout.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccLayout.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccLayout.cpp

src/CMakeFiles/dcclayout.dir/DccLayout.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccLayout.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccLayout.cpp > CMakeFiles/dcclayout.dir/DccLayout.cpp.i

src/CMakeFiles/dcclayout.dir/DccLayout.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccLayout.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccLayout.cpp -o CMakeFiles/dcclayout.dir/DccLayout.cpp.s

src/CMakeFiles/dcclayout.dir/DccConfig.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccConfig.cpp.o: ../src/DccConfig.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/dcclayout.dir/DccConfig.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccConfig.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccConfig.cpp

src/CMakeFiles/dcclayout.dir/DccConfig.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccConfig.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccConfig.cpp > CMakeFiles/dcclayout.dir/DccConfig.cpp.i

src/CMakeFiles/dcclayout.dir/DccConfig.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccConfig.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccConfig.cpp -o CMakeFiles/dcclayout.dir/DccConfig.cpp.s

src/CMakeFiles/dcclayout.dir/DccPath.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccPath.cpp.o: ../src/DccPath.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/CMakeFiles/dcclayout.dir/DccPath.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccPath.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccPath.cpp

src/CMakeFiles/dcclayout.dir/DccPath.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccPath.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccPath.cpp > CMakeFiles/dcclayout.dir/DccPath.cpp.i

src/CMakeFiles/dcclayout.dir/DccPath.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccPath.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccPath.cpp -o CMakeFiles/dcclayout.dir/DccPath.cpp.s

src/CMakeFiles/dcclayout.dir/DccShell.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccShell.cpp.o: ../src/DccShell.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/CMakeFiles/dcclayout.dir/DccShell.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccShell.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccShell.cpp

src/CMakeFiles/dcclayout.dir/DccShell.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccShell.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccShell.cpp > CMakeFiles/dcclayout.dir/DccShell.cpp.i

src/CMakeFiles/dcclayout.dir/DccShell.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccShell.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccShell.cpp -o CMakeFiles/dcclayout.dir/DccShell.cpp.s

src/CMakeFiles/dcclayout.dir/AsyncSerial.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/AsyncSerial.cpp.o: ../src/AsyncSerial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/CMakeFiles/dcclayout.dir/AsyncSerial.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/AsyncSerial.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/AsyncSerial.cpp

src/CMakeFiles/dcclayout.dir/AsyncSerial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/AsyncSerial.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/AsyncSerial.cpp > CMakeFiles/dcclayout.dir/AsyncSerial.cpp.i

src/CMakeFiles/dcclayout.dir/AsyncSerial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/AsyncSerial.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/AsyncSerial.cpp -o CMakeFiles/dcclayout.dir/AsyncSerial.cpp.s

src/CMakeFiles/dcclayout.dir/DccSerial.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccSerial.cpp.o: ../src/DccSerial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/CMakeFiles/dcclayout.dir/DccSerial.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccSerial.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccSerial.cpp

src/CMakeFiles/dcclayout.dir/DccSerial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccSerial.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccSerial.cpp > CMakeFiles/dcclayout.dir/DccSerial.cpp.i

src/CMakeFiles/dcclayout.dir/DccSerial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccSerial.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccSerial.cpp -o CMakeFiles/dcclayout.dir/DccSerial.cpp.s

src/CMakeFiles/dcclayout.dir/DccShellCmd.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/DccShellCmd.cpp.o: ../src/DccShellCmd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/CMakeFiles/dcclayout.dir/DccShellCmd.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/DccShellCmd.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/DccShellCmd.cpp

src/CMakeFiles/dcclayout.dir/DccShellCmd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/DccShellCmd.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/DccShellCmd.cpp > CMakeFiles/dcclayout.dir/DccShellCmd.cpp.i

src/CMakeFiles/dcclayout.dir/DccShellCmd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/DccShellCmd.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/DccShellCmd.cpp -o CMakeFiles/dcclayout.dir/DccShellCmd.cpp.s

src/CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.o: src/CMakeFiles/dcclayout.dir/flags.make
src/CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.o: ../src/ShellCmdExec.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object src/CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.o"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.o -c /Users/gregor/Projects/DccEX-CLI/src/ShellCmdExec.cpp

src/CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.i"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gregor/Projects/DccEX-CLI/src/ShellCmdExec.cpp > CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.i

src/CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.s"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gregor/Projects/DccEX-CLI/src/ShellCmdExec.cpp -o CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.s

# Object files for target dcclayout
dcclayout_OBJECTS = \
"CMakeFiles/dcclayout.dir/main.cpp.o" \
"CMakeFiles/dcclayout.dir/Diag.cpp.o" \
"CMakeFiles/dcclayout.dir/DccVertex.cpp.o" \
"CMakeFiles/dcclayout.dir/DccGraph.cpp.o" \
"CMakeFiles/dcclayout.dir/DccPathFinder.cpp.o" \
"CMakeFiles/dcclayout.dir/DccLayout.cpp.o" \
"CMakeFiles/dcclayout.dir/DccConfig.cpp.o" \
"CMakeFiles/dcclayout.dir/DccPath.cpp.o" \
"CMakeFiles/dcclayout.dir/DccShell.cpp.o" \
"CMakeFiles/dcclayout.dir/AsyncSerial.cpp.o" \
"CMakeFiles/dcclayout.dir/DccSerial.cpp.o" \
"CMakeFiles/dcclayout.dir/DccShellCmd.cpp.o" \
"CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.o"

# External object files for target dcclayout
dcclayout_EXTERNAL_OBJECTS =

src/dcclayout: src/CMakeFiles/dcclayout.dir/main.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/Diag.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccVertex.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccGraph.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccPathFinder.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccLayout.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccConfig.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccPath.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccShell.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/AsyncSerial.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccSerial.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/DccShellCmd.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/ShellCmdExec.cpp.o
src/dcclayout: src/CMakeFiles/dcclayout.dir/build.make
src/dcclayout: /usr/local/lib/libnlohmann_json_schema_validator.a
src/dcclayout: /usr/local/lib/libfmt.a
src/dcclayout: src/CMakeFiles/dcclayout.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/gregor/Projects/DccEX-CLI/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX executable dcclayout"
	cd /Users/gregor/Projects/DccEX-CLI/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dcclayout.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/dcclayout.dir/build: src/dcclayout

.PHONY : src/CMakeFiles/dcclayout.dir/build

src/CMakeFiles/dcclayout.dir/clean:
	cd /Users/gregor/Projects/DccEX-CLI/build/src && $(CMAKE_COMMAND) -P CMakeFiles/dcclayout.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/dcclayout.dir/clean

src/CMakeFiles/dcclayout.dir/depend:
	cd /Users/gregor/Projects/DccEX-CLI/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gregor/Projects/DccEX-CLI /Users/gregor/Projects/DccEX-CLI/src /Users/gregor/Projects/DccEX-CLI/build /Users/gregor/Projects/DccEX-CLI/build/src /Users/gregor/Projects/DccEX-CLI/build/src/CMakeFiles/dcclayout.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/dcclayout.dir/depend
