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
include unsupported/test/CMakeFiles/special_functions_3.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include unsupported/test/CMakeFiles/special_functions_3.dir/compiler_depend.make

# Include the progress variables for this target.
include unsupported/test/CMakeFiles/special_functions_3.dir/progress.make

# Include the compile flags for this target's objects.
include unsupported/test/CMakeFiles/special_functions_3.dir/flags.make

unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.o: unsupported/test/CMakeFiles/special_functions_3.dir/flags.make
unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.o: /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/test/special_functions.cpp
unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.o: unsupported/test/CMakeFiles/special_functions_3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.o"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.o -MF CMakeFiles/special_functions_3.dir/special_functions.cpp.o.d -o CMakeFiles/special_functions_3.dir/special_functions.cpp.o -c /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/test/special_functions.cpp

unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/special_functions_3.dir/special_functions.cpp.i"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/test/special_functions.cpp > CMakeFiles/special_functions_3.dir/special_functions.cpp.i

unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/special_functions_3.dir/special_functions.cpp.s"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test && /usr/bin/aarch64-bullseye-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/test/special_functions.cpp -o CMakeFiles/special_functions_3.dir/special_functions.cpp.s

# Object files for target special_functions_3
special_functions_3_OBJECTS = \
"CMakeFiles/special_functions_3.dir/special_functions.cpp.o"

# External object files for target special_functions_3
special_functions_3_EXTERNAL_OBJECTS =

unsupported/test/special_functions_3: unsupported/test/CMakeFiles/special_functions_3.dir/special_functions.cpp.o
unsupported/test/special_functions_3: unsupported/test/CMakeFiles/special_functions_3.dir/build.make
unsupported/test/special_functions_3: unsupported/test/CMakeFiles/special_functions_3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable special_functions_3"
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/special_functions_3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unsupported/test/CMakeFiles/special_functions_3.dir/build: unsupported/test/special_functions_3
.PHONY : unsupported/test/CMakeFiles/special_functions_3.dir/build

unsupported/test/CMakeFiles/special_functions_3.dir/clean:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test && $(CMAKE_COMMAND) -P CMakeFiles/special_functions_3.dir/cmake_clean.cmake
.PHONY : unsupported/test/CMakeFiles/special_functions_3.dir/clean

unsupported/test/CMakeFiles/special_functions_3.dir/depend:
	cd /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen /home/bardy/Documents/code/robotics/2024-frc-with-samvs/include/simpleNN/eigen/unsupported/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test /home/bardy/Documents/code/robotics/2024-frc-with-samvs/build/unsupported/test/CMakeFiles/special_functions_3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unsupported/test/CMakeFiles/special_functions_3.dir/depend

