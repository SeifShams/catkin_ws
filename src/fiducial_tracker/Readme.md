To launch the camera driver:
roslaunch azure_kinect_ros_driver driver.launch color_resolution:=720P fps:=30 depth_mode:=NFOV_2X2BINNED

To integrate the camera URDF with the tugger train:
1. export ROS_MASTER_URI=http://10.157.114.241:11311
2. export ROS_IP=10.157.114.215 
3. roslaunch azure_kinect_ros_driver driver.launch color_resolution:=720P fps:=30 depth_mode:=NFOV_2X2BINNED overwrite_robot_description:=false tf_prefix:="depth_front_"

To start the ArUco code tracker:
roslaunch fiducial_tracker aruco_tracker.launch

To start fiducial navigation:
1. export ROS_MASTER_URI=http://10.157.114.241:11311
2. export ROS_IP=10.157.114.215 
3. roslaunch fiducial_navigation fiducial_navigation.launch vel_topic:=output_vel offset_x:=0.5 camera_frame:=depth_front_camera_base

