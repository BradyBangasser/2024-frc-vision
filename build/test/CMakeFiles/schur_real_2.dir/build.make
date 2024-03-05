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
include test/CMakeFiles/schur_real_2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/schur_real_2.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/schur_real_2.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/schur_real_2.dir/flags.make

test/CMakeFiles/schur_real_2.dir/schur_real.cpp.o: test/CMakeFiles/schur_real_2.dir/flags.make
test/CMakeFiles/schur_real_2.dir/schur_real.cpp.o: /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/schur_real.cpp
test/CMakeFiles/schur_real_2.dir/schur_real.cpp.o: test/CMakeFiles/schur_real_2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/schur_real_2.dir/schur_real.cpp.o"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/schur_real_2.dir/schur_real.cpp.o -MF CMakeFiles/schur_real_2.dir/schur_real.cpp.o.d -o CMakeFiles/schur_real_2.dir/schur_real.cpp.o -c /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/schur_real.cpp

test/CMakeFiles/schur_real_2.dir/schur_real.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/schur_real_2.dir/schur_real.cpp.i"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/schur_real.cpp > CMakeFiles/schur_real_2.dir/schur_real.cpp.i

test/CMakeFiles/schur_real_2.dir/schur_real.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/schur_real_2.dir/schur_real.cpp.s"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/schur_real.cpp -o CMakeFiles/schur_real_2.dir/schur_real.cpp.s

# Object files for target schur_real_2
schur_real_2_OBJECTS = \
"CMakeFiles/schur_real_2.dir/schur_real.cpp.o"

# External object files for target schur_real_2
schur_real_2_EXTERNAL_OBJECTS =

test/schur_real_2: test/CMakeFiles/schur_real_2.dir/schur_real.cpp.o
test/schur_real_2: test/CMakeFiles/schur_real_2.dir/build.make
test/schur_real_2: test/CMakeFiles/schur_real_2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable schur_real_2"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/schur_real_2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/schur_real_2.dir/build: test/schur_real_2
.PHONY : test/CMakeFiles/schur_real_2.dir/build

test/CMakeFiles/schur_real_2.dir/clean:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -P CMakeFiles/schur_real_2.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/schur_real_2.dir/clean

test/CMakeFiles/schur_real_2.dir/depend:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test/CMakeFiles/schur_real_2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/schur_real_2.dir/depend

