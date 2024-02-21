# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "message_logger;soem_rsl;soem_interface;roscpp;rosconsole_bridge;sensor_msgs;trajectory_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ldunker_ethercat_interface".split(';') if "-ldunker_ethercat_interface" != "" else []
PROJECT_NAME = "dunker_ethercat_interface"
PROJECT_SPACE_DIR = "/home/seif/catkin_ws/install"
PROJECT_VERSION = "0.0.0"
