# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/seif/catkin_ws/src/ethercat_grant

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/seif/catkin_ws/build/ethercat_grant

# Include any dependencies generated for this target.
include CMakeFiles/ethercat_grant.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ethercat_grant.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ethercat_grant.dir/flags.make

CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.o: CMakeFiles/ethercat_grant.dir/flags.make
CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.o: /home/seif/catkin_ws/src/ethercat_grant/src/ethercat_grant.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/seif/catkin_ws/build/ethercat_grant/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.o -c /home/seif/catkin_ws/src/ethercat_grant/src/ethercat_grant.cpp

CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/seif/catkin_ws/src/ethercat_grant/src/ethercat_grant.cpp > CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.i

CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/seif/catkin_ws/src/ethercat_grant/src/ethercat_grant.cpp -o CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.s

# Object files for target ethercat_grant
ethercat_grant_OBJECTS = \
"CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.o"

# External object files for target ethercat_grant
ethercat_grant_EXTERNAL_OBJECTS =

/home/seif/catkin_ws/devel/.private/ethercat_grant/lib/ethercat_grant/ethercat_grant: CMakeFiles/ethercat_grant.dir/src/ethercat_grant.cpp.o
/home/seif/catkin_ws/devel/.private/ethercat_grant/lib/ethercat_grant/ethercat_grant: CMakeFiles/ethercat_grant.dir/build.make
/home/seif/catkin_ws/devel/.private/ethercat_grant/lib/ethercat_grant/ethercat_grant: CMakeFiles/ethercat_grant.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/seif/catkin_ws/build/ethercat_grant/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/seif/catkin_ws/devel/.private/ethercat_grant/lib/ethercat_grant/ethercat_grant"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ethercat_grant.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ethercat_grant.dir/build: /home/seif/catkin_ws/devel/.private/ethercat_grant/lib/ethercat_grant/ethercat_grant

.PHONY : CMakeFiles/ethercat_grant.dir/build

CMakeFiles/ethercat_grant.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ethercat_grant.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ethercat_grant.dir/clean

CMakeFiles/ethercat_grant.dir/depend:
	cd /home/seif/catkin_ws/build/ethercat_grant && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/seif/catkin_ws/src/ethercat_grant /home/seif/catkin_ws/src/ethercat_grant /home/seif/catkin_ws/build/ethercat_grant /home/seif/catkin_ws/build/ethercat_grant /home/seif/catkin_ws/build/ethercat_grant/CMakeFiles/ethercat_grant.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ethercat_grant.dir/depend
