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

# Utility rule file for buildsmoketests.

# Include any custom commands dependencies for this target.
include test/CMakeFiles/buildsmoketests.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/buildsmoketests.dir/progress.make

buildsmoketests: test/CMakeFiles/buildsmoketests.dir/build.make
.PHONY : buildsmoketests

# Rule to build all files generated by this target.
test/CMakeFiles/buildsmoketests.dir/build: buildsmoketests
.PHONY : test/CMakeFiles/buildsmoketests.dir/build

test/CMakeFiles/buildsmoketests.dir/clean:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test && $(CMAKE_COMMAND) -P CMakeFiles/buildsmoketests.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/buildsmoketests.dir/clean

test/CMakeFiles/buildsmoketests.dir/depend:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/test/CMakeFiles/buildsmoketests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/buildsmoketests.dir/depend

