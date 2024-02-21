# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tug_navigation_tools: 2 messages, 8 services")

set(MSG_I_FLAGS "-Itug_navigation_tools:/home/seif/catkin_ws/src/tug_navigation_tools/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tug_navigation_tools_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" ""
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" "std_msgs/Header:geometry_msgs/PoseStamped:geometry_msgs/Pose:nav_msgs/Path:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" NAME_WE)
add_custom_target(_tug_navigation_tools_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tug_navigation_tools" "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" "std_msgs/Header:geometry_msgs/PoseStamped:geometry_msgs/Pose:nav_msgs/Path:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_msg_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)

### Generating Services
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_cpp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
)

### Generating Module File
_generate_module_cpp(tug_navigation_tools
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tug_navigation_tools_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tug_navigation_tools_generate_messages tug_navigation_tools_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_cpp _tug_navigation_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tug_navigation_tools_gencpp)
add_dependencies(tug_navigation_tools_gencpp tug_navigation_tools_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tug_navigation_tools_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_msg_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)

### Generating Services
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_eus(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
)

### Generating Module File
_generate_module_eus(tug_navigation_tools
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tug_navigation_tools_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tug_navigation_tools_generate_messages tug_navigation_tools_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_eus _tug_navigation_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tug_navigation_tools_geneus)
add_dependencies(tug_navigation_tools_geneus tug_navigation_tools_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tug_navigation_tools_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_msg_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)

### Generating Services
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_lisp(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
)

### Generating Module File
_generate_module_lisp(tug_navigation_tools
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tug_navigation_tools_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tug_navigation_tools_generate_messages tug_navigation_tools_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_lisp _tug_navigation_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tug_navigation_tools_genlisp)
add_dependencies(tug_navigation_tools_genlisp tug_navigation_tools_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tug_navigation_tools_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_msg_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)

### Generating Services
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_nodejs(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
)

### Generating Module File
_generate_module_nodejs(tug_navigation_tools
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tug_navigation_tools_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tug_navigation_tools_generate_messages tug_navigation_tools_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_nodejs _tug_navigation_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tug_navigation_tools_gennodejs)
add_dependencies(tug_navigation_tools_gennodejs tug_navigation_tools_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tug_navigation_tools_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_msg_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)

### Generating Services
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)
_generate_srv_py(tug_navigation_tools
  "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Path.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
)

### Generating Module File
_generate_module_py(tug_navigation_tools
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tug_navigation_tools_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tug_navigation_tools_generate_messages tug_navigation_tools_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/EmergencyStop.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/msg/AccelerationStamped.msg" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/translational_movement.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/FinePositioning.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/PrenavigationPathplanner.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/parking_position.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/rotate_to_angle.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/calculate_rotation.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/seif/catkin_ws/src/tug_navigation_tools/srv/trajectory.srv" NAME_WE)
add_dependencies(tug_navigation_tools_generate_messages_py _tug_navigation_tools_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tug_navigation_tools_genpy)
add_dependencies(tug_navigation_tools_genpy tug_navigation_tools_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tug_navigation_tools_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tug_navigation_tools
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(tug_navigation_tools_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(tug_navigation_tools_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(tug_navigation_tools_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tug_navigation_tools
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(tug_navigation_tools_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(tug_navigation_tools_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(tug_navigation_tools_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tug_navigation_tools
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(tug_navigation_tools_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(tug_navigation_tools_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(tug_navigation_tools_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tug_navigation_tools
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(tug_navigation_tools_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(tug_navigation_tools_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(tug_navigation_tools_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tug_navigation_tools
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(tug_navigation_tools_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(tug_navigation_tools_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(tug_navigation_tools_generate_messages_py nav_msgs_generate_messages_py)
endif()
