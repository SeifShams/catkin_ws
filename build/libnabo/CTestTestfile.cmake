# CMake generated Testfile for 
# Source directory: /home/seif/catkin_ws/src/libnabo
# Build directory: /home/seif/catkin_ws/build/libnabo
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_libnabo_gtest_test_nabo "/home/seif/catkin_ws/build/libnabo/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/seif/catkin_ws/build/libnabo/test_results/libnabo/gtest-test_nabo.xml" "--return-code" "/home/seif/catkin_ws/build/libnabo/devel/lib/libnabo/test_nabo --gtest_output=xml:/home/seif/catkin_ws/build/libnabo/test_results/libnabo/gtest-test_nabo.xml")
set_tests_properties(_ctest_libnabo_gtest_test_nabo PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/seif/catkin_ws/src/libnabo/CatkinBuild.cmake;79;catkin_add_gtest;/home/seif/catkin_ws/src/libnabo/CatkinBuild.cmake;0;;/home/seif/catkin_ws/src/libnabo/CMakeLists.txt;20;include;/home/seif/catkin_ws/src/libnabo/CMakeLists.txt;0;")
subdirs("gtest")
