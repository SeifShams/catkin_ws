# Install script for directory: /home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/seif/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/seif/catkin_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/seif/catkin_ws/install" TYPE PROGRAM FILES "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/seif/catkin_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/seif/catkin_ws/install" TYPE PROGRAM FILES "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/seif/catkin_ws/install/setup.bash;/home/seif/catkin_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/seif/catkin_ws/install" TYPE FILE FILES
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/setup.bash"
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/seif/catkin_ws/install/setup.sh;/home/seif/catkin_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/seif/catkin_ws/install" TYPE FILE FILES
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/setup.sh"
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/seif/catkin_ws/install/setup.zsh;/home/seif/catkin_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/seif/catkin_ws/install" TYPE FILE FILES
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/setup.zsh"
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/seif/catkin_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/seif/catkin_ws/install" TYPE FILE FILES "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spencer_bagfile_tools/msg" TYPE FILE FILES "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/msg/AdditionalOdometryData.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spencer_bagfile_tools/cmake" TYPE FILE FILES "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/spencer_bagfile_tools-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/include/spencer_bagfile_tools")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/share/roseus/ros/spencer_bagfile_tools")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/share/common-lisp/ros/spencer_bagfile_tools")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/share/gennodejs/ros/spencer_bagfile_tools")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/python3/dist-packages/spencer_bagfile_tools")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/python3/dist-packages/spencer_bagfile_tools")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spencer_bagfile_tools" TYPE FILE FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/include/spencer_bagfile_tools/ReconstructOdometryConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/spencer_bagfile_tools" TYPE FILE FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/python3/dist-packages/spencer_bagfile_tools/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/python3/dist-packages/spencer_bagfile_tools/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/spencer_bagfile_tools" TYPE DIRECTORY FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/python3/dist-packages/spencer_bagfile_tools/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/spencer_bagfile_tools.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spencer_bagfile_tools/cmake" TYPE FILE FILES "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/spencer_bagfile_tools-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spencer_bagfile_tools/cmake" TYPE FILE FILES
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/spencer_bagfile_toolsConfig.cmake"
    "/home/seif/catkin_ws/build/spencer_bagfile_tools/catkin_generated/installspace/spencer_bagfile_toolsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spencer_bagfile_tools" TYPE FILE FILES "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools" TYPE PROGRAM FILES
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/create_thumbnails.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/dump_encoder_values.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/dump_tf_frames.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/dump_timestamps.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/interpolate_odometry.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/odom_to_tf.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/play.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/plot_tf.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/postprocess_bagfile.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/reconstruct_odometry.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/replace_frames.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/shift_timestamps.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/speedup_bagfile.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/visualize_frustum.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/visualize_plane.py"
    "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/scripts/tf_filter.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools" TYPE EXECUTABLE FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/spencer_bagfile_tools/panorama_builder")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/panorama_builder")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools" TYPE EXECUTABLE FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/spencer_bagfile_tools/laser_scan_inverter")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/laser_scan_inverter")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools" TYPE EXECUTABLE FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/spencer_bagfile_tools/pose_to_odometry")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/pose_to_odometry")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools" TYPE EXECUTABLE FILES "/home/seif/catkin_ws/devel/.private/spencer_bagfile_tools/lib/spencer_bagfile_tools/publish_camera_info")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/spencer_bagfile_tools/publish_camera_info")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spencer_bagfile_tools/launch" TYPE DIRECTORY FILES "/home/seif/catkin_ws/src/spencer_people_tracking/utils/spencer_bagfile_tools/launch/" REGEX "/\\.svn$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/seif/catkin_ws/build/spencer_bagfile_tools/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/seif/catkin_ws/build/spencer_bagfile_tools/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
