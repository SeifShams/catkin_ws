#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import PoseWithCovarianceStamped
from nav_msgs.msg import Odometry  # Replace with the actual message type

class Synchronizer:
    def __init__(self):
        # Initialize the node
        rospy.init_node('synchronizer_node')

        # Subscribers
        self.amcl_pose_sub = rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, self.amcl_pose_callback)
        self.ground_truth_sub = rospy.Subscriber("/ground_truth/state", Odometry, self.ground_truth_callback)  # Update message type

        # Publishers
        self.amcl_pose_pub = rospy.Publisher("/amcl_pose_sync", PoseWithCovarianceStamped, queue_size=10)
        self.ground_truth_pub = rospy.Publisher("/ground_truth/state_sync", Odometry, queue_size=10)  # Update message type

        # Variables to store the latest data
        self.latest_amcl_pose = None
        self.latest_ground_truth = None

    def amcl_pose_callback(self, msg):
        self.latest_amcl_pose = msg

    def ground_truth_callback(self, msg):
        self.latest_ground_truth = msg

    def run(self):
        rate = rospy.Rate(10)  # Set your desired frequency
        while not rospy.is_shutdown():
            if self.latest_amcl_pose:
                self.amcl_pose_pub.publish(self.latest_amcl_pose)
            if self.latest_ground_truth:
                self.ground_truth_pub.publish(self.latest_ground_truth)
            rate.sleep()

if __name__ == '__main__':
    synchronizer = Synchronizer()
    synchronizer.run()
