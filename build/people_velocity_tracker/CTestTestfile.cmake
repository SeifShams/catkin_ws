# CMake generated Testfile for 
# Source directory: /home/seif/catkin_ws/src/people/people_velocity_tracker
# Build directory: /home/seif/catkin_ws/build/people_velocity_tracker
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_people_velocity_tracker_roslint_package "/home/seif/catkin_ws/build/people_velocity_tracker/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/seif/catkin_ws/build/people_velocity_tracker/test_results/people_velocity_tracker/roslint-people_velocity_tracker.xml" "--working-dir" "/home/seif/catkin_ws/build/people_velocity_tracker" "--return-code" "/opt/ros/noetic/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/seif/catkin_ws/build/people_velocity_tracker/test_results/people_velocity_tracker/roslint-people_velocity_tracker.xml make roslint_people_velocity_tracker")
set_tests_properties(_ctest_people_velocity_tracker_roslint_package PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslint/cmake/roslint-extras.cmake;67;catkin_run_tests_target;/home/seif/catkin_ws/src/people/people_velocity_tracker/CMakeLists.txt;21;roslint_add_test;/home/seif/catkin_ws/src/people/people_velocity_tracker/CMakeLists.txt;0;")
subdirs("gtest")
