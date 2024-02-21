cmake_minimum_required(VERSION 3.0.2)
project(fiducial_navigation)

set(CMAKE_CXX_STANDARD 17)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  roscpp
  sensor_msgs
  tf
  tf2
  tf2_ros
  visualization_msgs
)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS roscpp geometry_msgs visualization_msgs
)

## Declare a C++ interface library.
add_library(catkin_deps INTERFACE)
target_link_libraries(catkin_deps INTERFACE ${catkin_LIBRARIES})
target_include_directories(catkin_deps INTERFACE include ${catkin_INCLUDE_DIRS})

## Declare a C++ library.
add_library(${PROJECT_NAME}
  src/fiducial_navigation/FiducialNavigation.cpp include/fiducial_navigation/FiducialNavigation.hpp
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

add_executable(fiducial_navigation_node src/fiducial_navigation_node.cpp src/fiducial_navigation/FiducialNavigation.cpp)
add_dependencies(fiducial_navigation_node ${${PROJECT_NAME}_EXPORTED_TARGETS}
                 ${catkin_EXPORTED_TARGETS})

target_link_libraries(fiducial_navigation_node ${catkin_LIBRARIES} ${OpenCV_LIBS})

#############
## Install ##
#############

## Mark cpp header files for installation.
install(DIRECTORY include/fiducial_navigation
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.hpp"
)

## Mark executables and/or libraries for installation
install(TARGETS fiducial_navigation_node
   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

