#!/usr/bin/env python3
import rospy
from nav_msgs.msg import Odometry

class Synchronizer:
    def __init__(self):
        # Initialize the node
        rospy.init_node('synchronizer_node')

        # Subscribers
        self.odometry_filtered_sub = rospy.Subscriber("/odometry/filtered", Odometry, self.odometry_filtered_callback)
        self.ground_truth_sub = rospy.Subscriber("/ground_truth/state", Odometry, self.ground_truth_callback)

        # Publishers
        self.odometry_filtered_pub = rospy.Publisher("/odometry/filtered_sync", Odometry, queue_size=10)
        self.ground_truth_pub = rospy.Publisher("/ground_truth/state_sync", Odometry, queue_size=10)

        # Variables to store the latest data
        self.latest_odometry_filtered = None
        self.latest_ground_truth = None

    def odometry_filtered_callback(self, msg):
        self.latest_odometry_filtered = msg

    def ground_truth_callback(self, msg):
        self.latest_ground_truth = msg

    def run(self):
        rate = rospy.Rate(10)  # Set your desired frequency
        while not rospy.is_shutdown():
            if self.latest_odometry_filtered:
                self.odometry_filtered_pub.publish(self.latest_odometry_filtered)
            if self.latest_ground_truth:
                self.ground_truth_pub.publish(self.latest_ground_truth)
            rate.sleep()

if __name__ == '__main__':
    synchronizer = Synchronizer()
    synchronizer.run()

