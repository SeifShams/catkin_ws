#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist
import time

def move_robot():
    # Initialize the node
    rospy.init_node('robot_mover', anonymous=True)

    # Create a publisher
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

    # Define the rate
    rate = rospy.Rate(10)  # 10hz

    # Initialize the Twist message
    move_cmd = Twist()

    # Move forward
    move_cmd.linear.x = 0.5  # Set a forward velocity
    move_cmd.angular.z = 0   # No rotation
    start_time = time.time()
    while time.time() - start_time < 6:
        pub.publish(move_cmd)
        rate.sleep()

    # Turn in a half circle
    move_cmd.linear.x = 0.1     # No forward movement
    move_cmd.angular.z = 0.5  # Set an angular velocity for turning
    # Assuming it takes 5 seconds to turn half circle
    start_time = time.time()
    while time.time() - start_time < 6.3:
        pub.publish(move_cmd)
        rate.sleep()

     # Move forward
    move_cmd.linear.x = 0.5  # Set a forward velocity
    move_cmd.angular.z = 0   # No rotation
    start_time = time.time()
    while time.time() - start_time < 6:
        pub.publish(move_cmd)
        rate.sleep()
    # Stop the robot
    move_cmd.linear.x = 0
    move_cmd.angular.z = 0
    pub.publish(move_cmd)

if __name__ == '__main__':
    try:
        move_robot()
    except rospy.ROSInterruptException:
        pass

