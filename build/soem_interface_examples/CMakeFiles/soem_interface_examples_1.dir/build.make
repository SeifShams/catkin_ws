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
CMAKE_SOURCE_DIR = /home/seif/catkin_ws/src/soem_interface/soem_interface_examples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/seif/catkin_ws/build/soem_interface_examples

# Include any dependencies generated for this target.
include CMakeFiles/soem_interface_examples_1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/soem_interface_examples_1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/soem_interface_examples_1.dir/flags.make

CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.o: CMakeFiles/soem_interface_examples_1.dir/flags.make
CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.o: /home/seif/catkin_ws/src/soem_interface/soem_interface_examples/src/example_slave.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/seif/catkin_ws/build/soem_interface_examples/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.o -c /home/seif/catkin_ws/src/soem_interface/soem_interface_examples/src/example_slave.cpp

CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/seif/catkin_ws/src/soem_interface/soem_interface_examples/src/example_slave.cpp > CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.i

CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/seif/catkin_ws/src/soem_interface/soem_interface_examples/src/example_slave.cpp -o CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.s

# Object files for target soem_interface_examples_1
soem_interface_examples_1_OBJECTS = \
"CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.o"

# External object files for target soem_interface_examples_1
soem_interface_examples_1_EXTERNAL_OBJECTS =

/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: CMakeFiles/soem_interface_examples_1.dir/src/example_slave.cpp.o
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: CMakeFiles/soem_interface_examples_1.dir/build.make
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/libsoem_interface_examples.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /home/seif/catkin_ws/devel/.private/soem_interface/lib/libsoem_interface.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /home/seif/catkin_ws/devel/.private/message_logger/lib/libmessage_logger.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/libroscpp.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/librosconsole.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/librostime.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /opt/ros/noetic/lib/libcpp_common.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: /home/seif/catkin_ws/devel/.private/soem_rsl/lib/libsoem.so
/home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1: CMakeFiles/soem_interface_examples_1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/seif/catkin_ws/build/soem_interface_examples/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/soem_interface_examples_1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/soem_interface_examples_1.dir/build: /home/seif/catkin_ws/devel/.private/soem_interface_examples/lib/soem_interface_examples/soem_interface_examples_1

.PHONY : CMakeFiles/soem_interface_examples_1.dir/build

CMakeFiles/soem_interface_examples_1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/soem_interface_examples_1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/soem_interface_examples_1.dir/clean

CMakeFiles/soem_interface_examples_1.dir/depend:
	cd /home/seif/catkin_ws/build/soem_interface_examples && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/seif/catkin_ws/src/soem_interface/soem_interface_examples /home/seif/catkin_ws/src/soem_interface/soem_interface_examples /home/seif/catkin_ws/build/soem_interface_examples /home/seif/catkin_ws/build/soem_interface_examples /home/seif/catkin_ws/build/soem_interface_examples/CMakeFiles/soem_interface_examples_1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/soem_interface_examples_1.dir/depend

