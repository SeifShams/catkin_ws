import rospy
from cartographer_ros_msgs.srv import StartTrajectory
from geometry_msgs.msg import Pose

# Initialize node (if not already initialized)
rospy.init_node('start_trajectory_node')

# Service proxy setup
service_name = '/start_trajectory'
rospy.wait_for_service(service_name)
start_trajectory = rospy.ServiceProxy(service_name, StartTrajectory)

# Define initial pose (this should be the final pose of the last trajectory)
initial_pose = Pose()
initial_pose.position.x = 12 # Add the x position here
initial_pose.position.y = 1 # Add the y position here
initial_pose.orientation.z = 0 # Add the z orientation here
initial_pose.orientation.w = # Add the w orientation here

# Fill in the service request
trajectory_request = StartTrajectoryRequest()
trajectory_request.configuration_directory = '~/catkin_ws/src/testing_cartographer/config'
trajectory_request.configuration_basename = 'tugger_train_localization.lua'
trajectory_request.use_initial_pose = True
trajectory_request.initial_pose = initial_pose
trajectory_request.relative_to_trajectory_id = 0 # Add the ID of the last trajectory here

# Call the service
try:
    response = start_trajectory(trajectory_request)
except rospy.ServiceException as e:
    rospy.logerr("Service call failed: %s", e)

# Check response and act accordingly
if response and response.status.code == cartographer_ros_msgs.StatusResponse.SUCCESS:
    print("Trajectory started successfully, ID:", response.trajectory_id)
else:
    print("Failed to start trajectory:", response.status.message if response else "No response")
