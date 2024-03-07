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
include test/CMakeFiles/conjugate_gradient_3.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/conjugate_gradient_3.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/conjugate_gradient_3.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/conjugate_gradient_3.dir/flags.make

test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o: test/CMakeFiles/conjugate_gradient_3.dir/flags.make
test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o: /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/conjugate_gradient.cpp
test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o: test/CMakeFiles/conjugate_gradient_3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o -MF CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o.d -o CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o -c /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/conjugate_gradient.cpp

test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.i"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/conjugate_gradient.cpp > CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.i

test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.s"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test/conjugate_gradient.cpp -o CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.s

# Object files for target conjugate_gradient_3
conjugate_gradient_3_OBJECTS = \
"CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o"

# External object files for target conjugate_gradient_3
conjugate_gradient_3_EXTERNAL_OBJECTS =

test/conjugate_gradient_3: test/CMakeFiles/conjugate_gradient_3.dir/conjugate_gradient.cpp.o
test/conjugate_gradient_3: test/CMakeFiles/conjugate_gradient_3.dir/build.make
test/conjugate_gradient_3: test/CMakeFiles/conjugate_gradient_3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable conjugate_gradient_3"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/conjugate_gradient_3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/conjugate_gradient_3.dir/build: test/conjugate_gradient_3
.PHONY : test/CMakeFiles/conjugate_gradient_3.dir/build

test/CMakeFiles/conjugate_gradient_3.dir/clean:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -P CMakeFiles/conjugate_gradient_3.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/conjugate_gradient_3.dir/clean

test/CMakeFiles/conjugate_gradient_3.dir/depend:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test/CMakeFiles/conjugate_gradient_3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/conjugate_gradient_3.dir/depend
