#!/usr/bin/env python3

import math
import rospy
import tf2_ros
import datetime
import pandas as pd
from tf2_geometry_msgs import PointStamped
from tf2_geometry_msgs import do_transform_pose
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseStamped


poses = []
ask_input = True
robot_pose = None
initial_pose = None
get_initial_pose = True
pose_topic = 'amcl_pose'


def pose_callback(pose_msg):
    global robot_pose
    robot_pose = pose_msg.pose.pose


def get_robot_pose(tf_buffer):
    global initial_pose
    # Camera frame and other relevant frame IDs
    refernce_frame = "mid_point"  # Replace with your actual frame ID
    robot_pose_frame = "base_footprint"  # Replace with your actual frame ID

    # Lookup the transform
    try:
        tf_reference_pose = tf_buffer.lookup_transform(
            refernce_frame,
            robot_pose_frame,
            rospy.Time(0)
        )
    except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
        rospy.logerr("Failed to lookup transform: %s", str(e))

    # Perform the transformation
    print ("\nInitial pose\n", initial_pose)
    print ("\nTransform from reference to pose\n", tf_reference_pose)

    # Perform the transformation
    #object_tf_base = tf_buffer.transform(initial_pose, tf_reference_pose)
    pose_from_reference = do_transform_pose(initial_pose, tf_reference_pose)
    print ("\nPose from reference:\n", pose_from_reference)
    return pose_from_reference
    

def record_pose(tf_buffer):
    global poses, get_initial_pose, initial_pose, pose_topic
    try:
        transform = tf_buffer.lookup_transform("map", "mid_point", rospy.Time(0), rospy.Duration(1.0))
        if get_initial_pose:
            initial_pose = PoseStamped()

            # Copy the header from the transform
            initial_pose.header = transform.header

            # Set the position of the pose
            initial_pose.pose.position = transform.transform.translation

            # Set the orientation of the pose
            initial_pose.pose.orientation = transform.transform.rotation
            get_initial_pose = False

        mid_point_x = round(transform.transform.translation.x, 3)
        mid_point_y = round(transform.transform.translation.y, 3)
        quaternion = (transform.transform.rotation.x, transform.transform.rotation.y, transform.transform.rotation.z, transform.transform.rotation.w)
        euler_angles = euler_from_quaternion(quaternion)
        mid_point_yaw = round(math.degrees(euler_angles[2]), 3)
        
    except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
        print ("Mid_point does not exist")
        return
    
    robot_pose_x = round(robot_pose.position.x,3)
    robot_pose_y = round(robot_pose.position.y,3)

    quaternion = (robot_pose.orientation.x, robot_pose.orientation.y, robot_pose.orientation.z, robot_pose.orientation.w)
    euler_angles = euler_from_quaternion(quaternion)
    robot_pose_yaw = round(math.degrees(euler_angles[2]), 3)

    #pose_from_reference = get_robot_pose(tf_buffer)
    #pose_from_reference_x = round(pose_from_reference.pose.position.x,3)
    #pose_from_reference_y = round(pose_from_reference.pose.position.y,3)

    #quaternion = (pose_from_reference.pose.orientation.x, pose_from_reference.pose.orientation.y, 
    #              pose_from_reference.pose.orientation.z, pose_from_reference.pose.orientation.w)
    #euler_angles = euler_from_quaternion(quaternion)
    #pose_from_reference_yaw = round(math.degrees(euler_angles[2]), 3)

    poses.append([robot_pose_x, robot_pose_y, robot_pose_yaw,
                   mid_point_x, mid_point_y, mid_point_yaw])
                   #pose_from_reference_x, pose_from_reference_y, pose_from_reference_yaw])
    
    output_data = pd.DataFrame(poses, columns=['Robot_X', 'Robot_Y', 'Robot_Yaw',
                                                'MidPoint_X', 'MidPoint_Y', 'MidPoint_Yaw']) 
    #                                            'New_Robot_X', 'New_Robot_Y', 'New_Robot_Yaw'])

    # Get the current date in the format "DD_MM_YY"
    current_date = datetime.datetime.now().strftime("%d%m%H%M")

    # Define the file name with the desired format
    file_name = "/home/seif/catkin_ws/src/fiducial_navigation/files" + pose_topic + "_" + current_date + ".xlsx"

    print (output_data)

    output_data.to_csv(file_name, index=False)
    print("Data saved to poses.csv")

def main():
    global ask_input, pose_topic
    rospy.init_node('pose_recorder')
    pose_topic = rospy.get_param('~pose_topic', '/amcl_pose')
    amcl_pose_sub = rospy.Subscriber(pose_topic, PoseWithCovarianceStamped, pose_callback)
    tf_buffer = tf2_ros.Buffer()
    tf_listener = tf2_ros.TransformListener(tf_buffer)

    while not rospy.is_shutdown():
        if ask_input:
            key = input("Press 's' to start recording, 'q' to quit: ")
            ask_input = False

        if key == 's':
            record_pose(tf_buffer)
            ask_input = True
        elif key == 'q':
            return
    
if __name__ == '__main__':
    main()
