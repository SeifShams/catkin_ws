cmake_minimum_required(VERSION 3.0.2)
project(art_tracker)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  tf2
  tf2_ros
  geometry_msgs
  tf2_sensor_msgs
  tf2_geometry_msgs
)


catkin_package(
  INCLUDE_DIRS include
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS roscpp std_msgs tf2_ros tf2_geometry_msgs geometry_msgs
)

## Declare a C++ interface library.
add_library(catkin_deps INTERFACE)
target_link_libraries(catkin_deps INTERFACE ${catkin_LIBRARIES})
target_include_directories(catkin_deps INTERFACE include ${catkin_INCLUDE_DIRS})

## Declare a C++ library.
add_library(${PROJECT_NAME}
src/art_tracker_node.cpp include/DTrackSDK.hpp
)

## Specify libraries to link a library target against.
target_link_libraries(${PROJECT_NAME} PUBLIC catkin_deps)

## Specify directories with header files fo the target.
target_include_directories(${PROJECT_NAME} PUBLIC include)

###########
## Build ##
###########

include_directories(include/)
include_directories(${catkin_INCLUDE_DIRS})

add_executable( art_tracker_node 
                src/art_tracker_node.cpp 
                src/DTrackSDK.cpp
                src/DTrackData.cpp
                src/DTrackNet.cpp
                src/DTrackParse.cpp
                src/DTrackParser.cpp)

add_dependencies(art_tracker_node ${${PROJECT_NAME}_EXPORTED_TARGETS}
                 ${catkin_EXPORTED_TARGETS})

target_link_libraries(art_tracker_node ${catkin_LIBRARIES})

#############
## Install ##
#############

## Mark cpp header files for installation.
install(DIRECTORY include
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.hpp"
)

## Mark executables and/or libraries for installation
install(TARGETS art_tracker_node
        DESTINATION lib/${PROJECT_NAME}
)


