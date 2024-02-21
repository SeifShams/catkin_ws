# CMake generated Testfile for 
# Source directory: /home/seif/catkin_ws/src/libpointmatcher
# Build directory: /home/seif/catkin_ws/build/libpointmatcher
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_libpointmatcher_gtest_test_pointmatcher "/home/seif/catkin_ws/build/libpointmatcher/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/seif/catkin_ws/build/libpointmatcher/test_results/libpointmatcher/gtest-test_pointmatcher.xml" "--return-code" "/home/seif/catkin_ws/devel/.private/libpointmatcher/lib/libpointmatcher/test_pointmatcher --gtest_output=xml:/home/seif/catkin_ws/build/libpointmatcher/test_results/libpointmatcher/gtest-test_pointmatcher.xml")
set_tests_properties(_ctest_libpointmatcher_gtest_test_pointmatcher PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/seif/catkin_ws/src/libpointmatcher/CatkinBuild.cmake;110;catkin_add_gtest;/home/seif/catkin_ws/src/libpointmatcher/CatkinBuild.cmake;0;;/home/seif/catkin_ws/src/libpointmatcher/CMakeLists.txt;77;include;/home/seif/catkin_ws/src/libpointmatcher/CMakeLists.txt;0;")
subdirs("gtest")
