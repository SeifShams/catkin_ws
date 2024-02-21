#!/usr/bin/env python3
import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from math import radians, degrees
from actionlib_msgs.msg import *
from geometry_msgs.msg import Point
from tf.transformations import euler_from_quaternion, quaternion_from_euler


# this method will make the robot move to the goal location
def move_to_goal(xGoal, yGoal, aGoal):
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

    goal.target_pose.pose.position = Point(xGoal, yGoal, 0)

    q = quaternion_from_euler(0, 0, aGoal)

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


def readTerminal():
    while True:
        position = input("New position? (y/n)")
        if position == 'n':
            break
        else:
            x_goal = input("position x: ")
            y_goal = input("position y: ")
            a_goal = input("orientation a: ")
            move_to_goal(float(x_goal), float(y_goal), float(a_goal))


if __name__ == '__main__':
    rospy.init_node('map_navigation', anonymous=False)
    readTerminal()