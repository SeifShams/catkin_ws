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
CMAKE_SOURCE_DIR = /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/seif/catkin_ws/build/spencer_tracking_utils

# Include any dependencies generated for this target.
include CMakeFiles/fix_orientation_of_non_moving_targets.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/fix_orientation_of_non_moving_targets.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fix_orientation_of_non_moving_targets.dir/flags.make

CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.o: CMakeFiles/fix_orientation_of_non_moving_targets.dir/flags.make
CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.o: /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/seif/catkin_ws/build/spencer_tracking_utils/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.o -c /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp

CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp > CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.i

CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp -o CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.s

# Object files for target fix_orientation_of_non_moving_targets
fix_orientation_of_non_moving_targets_OBJECTS = \
"CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.o"

# External object files for target fix_orientation_of_non_moving_targets
fix_orientation_of_non_moving_targets_EXTERNAL_OBJECTS =

/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: CMakeFiles/fix_orientation_of_non_moving_targets.dir/src/spencer_tracking_utils/fix_orientation_of_non_moving_targets.cpp.o
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: CMakeFiles/fix_orientation_of_non_moving_targets.dir/build.make
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libtf.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libtf2_ros.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libactionlib.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libmessage_filters.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libtf2.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libroscpp.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/librosconsole.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/librostime.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /opt/ros/noetic/lib/libcpp_common.so
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets: CMakeFiles/fix_orientation_of_non_moving_targets.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/seif/catkin_ws/build/spencer_tracking_utils/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fix_orientation_of_non_moving_targets.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fix_orientation_of_non_moving_targets.dir/build: /home/seif/catkin_ws/devel/.private/spencer_tracking_utils/lib/spencer_tracking_utils/fix_orientation_of_non_moving_targets

.PHONY : CMakeFiles/fix_orientation_of_non_moving_targets.dir/build

CMakeFiles/fix_orientation_of_non_moving_targets.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fix_orientation_of_non_moving_targets.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fix_orientation_of_non_moving_targets.dir/clean

CMakeFiles/fix_orientation_of_non_moving_targets.dir/depend:
	cd /home/seif/catkin_ws/build/spencer_tracking_utils && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils /home/seif/catkin_ws/src/spencer_people_tracking/tracking/people/spencer_tracking_utils /home/seif/catkin_ws/build/spencer_tracking_utils /home/seif/catkin_ws/build/spencer_tracking_utils /home/seif/catkin_ws/build/spencer_tracking_utils/CMakeFiles/fix_orientation_of_non_moving_targets.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fix_orientation_of_non_moving_targets.dir/depend

