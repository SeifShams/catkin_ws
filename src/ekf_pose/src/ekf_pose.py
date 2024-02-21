#!/usr/bin/env python3
import rospy
import tf
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Pose, Quaternion

class EKFPose:
    def __init__(self):
        rospy.init_node('ekf_pose', anonymous=True)
        
        # Subscribers
        self.odom_sub = rospy.Subscriber('/odometry/filtered', Odometry, self.odom_callback)
        self.tf_listener = tf.TransformListener()

        # Publishers
        self.pose_pub = rospy.Publisher('/ekf_pose', Pose, queue_size=10)

        # Pose data
        self.odom_pose = Pose()
        self.tf_pose = Pose()
        self.resultant_pose = Pose()

    def odom_callback(self, data):
        self.odom_pose = data.pose.pose
        self.process_data()

    def get_tf_data(self):
        try:
            (trans, rot) = self.tf_listener.lookupTransform('/map', '/odom', rospy.Time(0))
            self.tf_pose.position.x, self.tf_pose.position.y, self.tf_pose.position.z = trans
            self.tf_pose.orientation.x, self.tf_pose.orientation.y, self.tf_pose.orientation.z, self.tf_pose.orientation.w = rot
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            pass

    def sum_poses(self, pose1, pose2):
        summed_pose = Pose()
        # Sum positions
        summed_pose.position.x = pose1.position.x + pose2.position.x
        summed_pose.position.y = pose1.position.y + pose2.position.y
        summed_pose.position.z = pose1.position.z  # Assuming Z position remains unchanged

        # Orientations are simply copied from pose1 for simplicity
        summed_pose.orientation = pose1.orientation
        return summed_pose

    def process_data(self):
        self.get_tf_data()
        self.resultant_pose = self.sum_poses(self.odom_pose, self.tf_pose)

        # Publish the resultant summed pose
        self.pose_pub.publish(self.resultant_pose)

if __name__ == '__main__':
    ekf = EKFPose()
    rospy.spin()
