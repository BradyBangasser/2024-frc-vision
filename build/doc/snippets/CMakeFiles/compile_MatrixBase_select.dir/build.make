# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build

# Include any dependencies generated for this target.
include doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compiler_depend.make

# Include the progress variables for this target.
include doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/progress.make

# Include the compile flags for this target's objects.
include doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/flags.make

doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o: doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/flags.make
doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o: doc/snippets/compile_MatrixBase_select.cpp
doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o: /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/doc/snippets/MatrixBase_select.cpp
doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o: doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o -MF CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o.d -o CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o -c /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets/compile_MatrixBase_select.cpp

doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.i"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets/compile_MatrixBase_select.cpp > CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.i

doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.s"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets/compile_MatrixBase_select.cpp -o CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.s

# Object files for target compile_MatrixBase_select
compile_MatrixBase_select_OBJECTS = \
"CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o"

# External object files for target compile_MatrixBase_select
compile_MatrixBase_select_EXTERNAL_OBJECTS =

doc/snippets/compile_MatrixBase_select: doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/compile_MatrixBase_select.cpp.o
doc/snippets/compile_MatrixBase_select: doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/build.make
doc/snippets/compile_MatrixBase_select: doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable compile_MatrixBase_select"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compile_MatrixBase_select.dir/link.txt --verbose=$(VERBOSE)
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets && ./compile_MatrixBase_select >/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets/MatrixBase_select.out

# Rule to build all files generated by this target.
doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/build: doc/snippets/compile_MatrixBase_select
.PHONY : doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/build

doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/clean:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets && $(CMAKE_COMMAND) -P CMakeFiles/compile_MatrixBase_select.dir/cmake_clean.cmake
.PHONY : doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/clean

doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/depend:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/doc/snippets /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/snippets/CMakeFiles/compile_MatrixBase_select.dir/depend

