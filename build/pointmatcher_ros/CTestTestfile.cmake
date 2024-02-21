# CMake generated Testfile for 
# Source directory: /home/seif/catkin_ws/src/pointmatcher-ros
# Build directory: /home/seif/catkin_ws/build/pointmatcher_ros
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_pointmatcher_ros_gtest_test_pointmatcher_ros "/home/seif/catkin_ws/build/pointmatcher_ros/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/seif/catkin_ws/build/pointmatcher_ros/test_results/pointmatcher_ros/gtest-test_pointmatcher_ros.xml" "--return-code" "/home/seif/catkin_ws/devel/.private/pointmatcher_ros/lib/pointmatcher_ros/test_pointmatcher_ros --gtest_output=xml:/home/seif/catkin_ws/build/pointmatcher_ros/test_results/pointmatcher_ros/gtest-test_pointmatcher_ros.xml")
set_tests_properties(_ctest_pointmatcher_ros_gtest_test_pointmatcher_ros PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/seif/catkin_ws/src/pointmatcher-ros/CMakeLists.txt;97;catkin_add_gtest;/home/seif/catkin_ws/src/pointmatcher-ros/CMakeLists.txt;0;")
subdirs("gtest")
