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
CMAKE_SOURCE_DIR = /home/seif/catkin_ws/src/tug_neo_locate_station

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/seif/catkin_ws/build/tug_neo_locate_station

# Include any dependencies generated for this target.
include CMakeFiles/tug_neo_locate_station_math_toolbox.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tug_neo_locate_station_math_toolbox.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tug_neo_locate_station_math_toolbox.dir/flags.make

CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.o: CMakeFiles/tug_neo_locate_station_math_toolbox.dir/flags.make
CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.o: /home/seif/catkin_ws/src/tug_neo_locate_station/lib/math_toolbox.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/seif/catkin_ws/build/tug_neo_locate_station/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.o -c /home/seif/catkin_ws/src/tug_neo_locate_station/lib/math_toolbox.cpp

CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/seif/catkin_ws/src/tug_neo_locate_station/lib/math_toolbox.cpp > CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.i

CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/seif/catkin_ws/src/tug_neo_locate_station/lib/math_toolbox.cpp -o CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.s

# Object files for target tug_neo_locate_station_math_toolbox
tug_neo_locate_station_math_toolbox_OBJECTS = \
"CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.o"

# External object files for target tug_neo_locate_station_math_toolbox
tug_neo_locate_station_math_toolbox_EXTERNAL_OBJECTS =

/home/seif/catkin_ws/devel/.private/tug_neo_locate_station/lib/libtug_neo_locate_station_math_toolbox.a: CMakeFiles/tug_neo_locate_station_math_toolbox.dir/lib/math_toolbox.cpp.o
/home/seif/catkin_ws/devel/.private/tug_neo_locate_station/lib/libtug_neo_locate_station_math_toolbox.a: CMakeFiles/tug_neo_locate_station_math_toolbox.dir/build.make
/home/seif/catkin_ws/devel/.private/tug_neo_locate_station/lib/libtug_neo_locate_station_math_toolbox.a: CMakeFiles/tug_neo_locate_station_math_toolbox.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/seif/catkin_ws/build/tug_neo_locate_station/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library /home/seif/catkin_ws/devel/.private/tug_neo_locate_station/lib/libtug_neo_locate_station_math_toolbox.a"
	$(CMAKE_COMMAND) -P CMakeFiles/tug_neo_locate_station_math_toolbox.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tug_neo_locate_station_math_toolbox.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tug_neo_locate_station_math_toolbox.dir/build: /home/seif/catkin_ws/devel/.private/tug_neo_locate_station/lib/libtug_neo_locate_station_math_toolbox.a

.PHONY : CMakeFiles/tug_neo_locate_station_math_toolbox.dir/build

CMakeFiles/tug_neo_locate_station_math_toolbox.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tug_neo_locate_station_math_toolbox.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tug_neo_locate_station_math_toolbox.dir/clean

CMakeFiles/tug_neo_locate_station_math_toolbox.dir/depend:
	cd /home/seif/catkin_ws/build/tug_neo_locate_station && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/seif/catkin_ws/src/tug_neo_locate_station /home/seif/catkin_ws/src/tug_neo_locate_station /home/seif/catkin_ws/build/tug_neo_locate_station /home/seif/catkin_ws/build/tug_neo_locate_station /home/seif/catkin_ws/build/tug_neo_locate_station/CMakeFiles/tug_neo_locate_station_math_toolbox.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tug_neo_locate_station_math_toolbox.dir/depend
