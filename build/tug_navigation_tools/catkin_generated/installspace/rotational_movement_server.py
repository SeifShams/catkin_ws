#!/usr/bin/env python3

from __future__ import print_function
import actionlib
import rospy
from geometry_msgs.msg import PoseWithCovarianceStamped
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from math import radians, degrees
from actionlib_msgs.msg import *
from geometry_msgs.msg import Point
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from tug_navigation_tools.srv import rotational_movement


last_position_x = 0
last_position_y = 0
last_position_a = 0


def handle_rotational_movement_command(req):
    global last_position_x, last_position_y, last_position_a
    # define a client for to send goal requests to the move_base server through a SimpleActionClient
    ac = actionlib.SimpleActionClient("move_base", MoveBaseAction)

    # wait for the action server to come up
    while (not ac.wait_for_server(rospy.Duration.from_sec(5.0))):
        rospy.loginfo("Waiting for the move_base action server to come up")

    goal = MoveBaseGoal()

    # set up the frame parameters
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()

    # moving towards the goal*/
    goal.target_pose.pose.position = Point(last_position_x, last_position_y, 0)

    q = quaternion_from_euler(0, 0, last_position_a+req.angle)

    goal.target_pose.pose.orientation.x = q[0]
    goal.target_pose.pose.orientation.y = q[1]
    goal.target_pose.pose.orientation.z = q[2]
    goal.target_pose.pose.orientation.w = q[3]

    rospy.loginfo("Sending goal location ...")
    ac.send_goal(goal)

    ac.wait_for_result(rospy.Duration(60))

    if (ac.get_state() == GoalStatus.SUCCEEDED):
        rospy.loginfo("You have reached the destination")
        return True
    else:
        rospy.loginfo("The robot failed to reach the destination")
        return False


def callback(data):
    global last_position_x, last_position_y, last_position_a
    # read out the published pose of the robot
    last_position_x = data.pose.pose.position.x
    last_position_y = data.pose.pose.position.y
    # read out the angular values of the robots psoition
    # Transform quaternions to euler:
    orientation_list = [data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w]
    (roll, pitch, yaw) = euler_from_quaternion (orientation_list)
    last_position_a = yaw


def set_rotational_movement_server():
    rospy.init_node('set_rotational_movement_server')
    
    rospy.Subscriber('amcl_pose', PoseWithCovarianceStamped, callback)
    
    s = rospy.Service('set_rotational_movement', rotational_movement, handle_rotational_movement_command)
    print("rotational movement server started")
    rospy.spin()


if __name__ == "__main__":
    set_rotational_movement_server()
