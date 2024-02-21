#!/usr/bin/env python3
import rospy
from nav_msgs.msg import Odometry
import tf2_ros
import geometry_msgs.msg

class SyncedTFToPosePublisher:
    def __init__(self):
        # Initialize the node
        rospy.init_node('synced_tf_to_pose_publisher')

        # TF Buffer and Listener
        self.tf_buffer = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tf_buffer)

        # Pose Publisher for cart_pose
        self.pose_pub = rospy.Publisher("cart_pose", geometry_msgs.msg.PoseStamped, queue_size=10)

        # Subscriber for ground_truth/state
        self.ground_truth_sub = rospy.Subscriber("/ground_truth/state", Odometry, self.ground_truth_callback)

        # Publisher for the synchronized ground_truth/state
        self.sync_ground_truth_pub = rospy.Publisher("/ground_truth/state_sync", Odometry, queue_size=10)

        # Store the last received ground truth message
        self.last_ground_truth_msg = None

        # Set the frequency for the timer, e.g., 10 Hz
        self.publish_frequency = 10.0

        # Start a timer to synchronize the publications
        rospy.Timer(rospy.Duration(1.0 / self.publish_frequency), self.timer_callback)

    def ground_truth_callback(self, msg):
        # Store the last received ground truth message for synchronization
        self.last_ground_truth_msg = msg

    def timer_callback(self, event):
        if self.last_ground_truth_msg:
            try:
                # Look up the transformation between 'map' and 'base_link'
                trans = self.tf_buffer.lookup_transform('map', 'base_link', rospy.Time(0), rospy.Duration(1.0))
                pose_stamped = geometry_msgs.msg.PoseStamped()
                pose_stamped.header.stamp = rospy.Time.now()  # Use current time for synchronization
                pose_stamped.header.frame_id = 'map'
                pose_stamped.pose.position.x = trans.transform.translation.x
                pose_stamped.pose.position.y = trans.transform.translation.y
                pose_stamped.pose.position.z = trans.transform.translation.z
                pose_stamped.pose.orientation = trans.transform.rotation

                # Publish the 'base_link' pose in the 'map' frame as 'cart_pose'
                self.pose_pub.publish(pose_stamped)

                # Publish the synchronized ground truth message
                self.last_ground_truth_msg.header.stamp = pose_stamped.header.stamp  # Update the timestamp for synchronization
                self.sync_ground_truth_pub.publish(self.last_ground_truth_msg)

            except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
                rospy.logerr("Failed to get transform from 'map' to 'base_link': %s" % str(e))

if __name__ == '__main__':
    synced_tf_to_pose_publisher = SyncedTFToPosePublisher()
    rospy.spin()
