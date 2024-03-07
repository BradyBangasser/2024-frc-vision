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
include test/CMakeFiles/jacobi_5.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/jacobi_5.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/jacobi_5.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/jacobi_5.dir/flags.make

test/CMakeFiles/jacobi_5.dir/jacobi.cpp.o: test/CMakeFiles/jacobi_5.dir/flags.make
test/CMakeFiles/jacobi_5.dir/jacobi.cpp.o: /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/jacobi.cpp
test/CMakeFiles/jacobi_5.dir/jacobi.cpp.o: test/CMakeFiles/jacobi_5.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/jacobi_5.dir/jacobi.cpp.o"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/jacobi_5.dir/jacobi.cpp.o -MF CMakeFiles/jacobi_5.dir/jacobi.cpp.o.d -o CMakeFiles/jacobi_5.dir/jacobi.cpp.o -c /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/jacobi.cpp

test/CMakeFiles/jacobi_5.dir/jacobi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jacobi_5.dir/jacobi.cpp.i"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/jacobi.cpp > CMakeFiles/jacobi_5.dir/jacobi.cpp.i

test/CMakeFiles/jacobi_5.dir/jacobi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jacobi_5.dir/jacobi.cpp.s"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/jacobi.cpp -o CMakeFiles/jacobi_5.dir/jacobi.cpp.s

# Object files for target jacobi_5
jacobi_5_OBJECTS = \
"CMakeFiles/jacobi_5.dir/jacobi.cpp.o"

# External object files for target jacobi_5
jacobi_5_EXTERNAL_OBJECTS =

test/jacobi_5: test/CMakeFiles/jacobi_5.dir/jacobi.cpp.o
test/jacobi_5: test/CMakeFiles/jacobi_5.dir/build.make
test/jacobi_5: test/CMakeFiles/jacobi_5.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable jacobi_5"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jacobi_5.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/jacobi_5.dir/build: test/jacobi_5
.PHONY : test/CMakeFiles/jacobi_5.dir/build

test/CMakeFiles/jacobi_5.dir/clean:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -P CMakeFiles/jacobi_5.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/jacobi_5.dir/clean

test/CMakeFiles/jacobi_5.dir/depend:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test/CMakeFiles/jacobi_5.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/jacobi_5.dir/depend

