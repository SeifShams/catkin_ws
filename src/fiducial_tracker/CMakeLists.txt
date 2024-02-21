cmake_minimum_required(VERSION 3.0.2)
project(fiducial_tracker)


set(CMAKE_CXX_STANDARD 17)
## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  tf2_geometry_msgs
  tf2_ros
  tf2
  tf
  visualization_msgs
  vision_msgs
  image_transport
  cv_bridge
  sensor_msgs
  std_msgs
  fiducial_msgs
  pcl_ros
  pcl_conversions
)

find_package(OpenCV REQUIRED)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS roscpp std_msgs
)

## Declare a C++ interface library.
add_library(catkin_deps INTERFACE)
target_link_libraries(catkin_deps INTERFACE ${catkin_LIBRARIES})
target_include_directories(catkin_deps INTERFACE include ${catkin_INCLUDE_DIRS})

## Declare a C++ library.
add_library(${PROJECT_NAME}
  src/aruco_tracker/ArucoTracker.cpp include/fiducial_tracker/ArucoTracker.hpp
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
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(aruco_tracker_node src/aruco_tracker_node.cpp src/aruco_tracker/ArucoTracker.cpp)
add_dependencies(aruco_tracker_node ${${PROJECT_NAME}_EXPORTED_TARGETS}
                 ${catkin_EXPORTED_TARGETS})

target_link_libraries(aruco_tracker_node ${catkin_LIBRARIES} ${OpenCV_LIBS})

#############
## Install ##
#############

## Mark cpp header files for installation.
install(DIRECTORY include/fiducial_tracker
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.hpp"
)

## Mark executables and/or libraries for installation
install(TARGETS aruco_tracker_node
   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
