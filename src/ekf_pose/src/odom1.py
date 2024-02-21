#!/usr/bin/env python3
import rospy
import tf
import tf.transformations as tf_trans
from geometry_msgs.msg import TransformStamped

def get_transform(listener, frame1, frame2):
    try:
        return listener.lookupTransform(frame1, frame2, rospy.Time(0))
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
        rospy.loginfo("Could not find transform from {} to {}".format(frame2, frame1))
        return None

def combine_transforms(transform1, transform2):
    if transform1 is None or transform2 is None:
        return None

    trans1, rot1 = transform1
    trans2, rot2 = transform2

    mat1 = tf_trans.concatenate_matrices(tf_trans.translation_matrix(trans1), tf_trans.quaternion_matrix(rot1))
    mat2 = tf_trans.concatenate_matrices(tf_trans.translation_matrix(trans2), tf_trans.quaternion_matrix(rot2))

    combined_matrix = tf_trans.concatenate_matrices(mat1, mat2)

    combined_trans = tf_trans.translation_from_matrix(combined_matrix)
    combined_rot = tf_trans.quaternion_from_matrix(combined_matrix)

    return combined_trans, combined_rot

def listener():
    rospy.init_node('tf_listener', anonymous=True)
    tf_listener = tf.TransformListener()
    odom_pub = rospy.Publisher('odom1', TransformStamped, queue_size=10)
    rate = rospy.Rate(100)

    while not rospy.is_shutdown():
        transform1 = get_transform(tf_listener, '/odom', '/base_link')
        transform2 = get_transform(tf_listener, '/map', '/odom')
        
        combined_transform = combine_transforms(transform1, transform2)

        if combined_transform is not None:
            combined_trans_msg = TransformStamped()
            combined_trans_msg.header.stamp = rospy.Time.now()
            combined_trans_msg.header.frame_id = "map"
            combined_trans_msg.child_frame_id = "base_link"
            combined_trans_msg.transform.translation.x = combined_transform[0][0]
            combined_trans_msg.transform.translation.y = combined_transform[0][1]
            combined_trans_msg.transform.translation.z = combined_transform[0][2]
            combined_trans_msg.transform.rotation.x = combined_transform[1][0]
            combined_trans_msg.transform.rotation.y = combined_transform[1][1]
            combined_trans_msg.transform.rotation.z = combined_transform[1][2]
            combined_trans_msg.transform.rotation.w = combined_transform[1][3]

            odom_pub.publish(combined_trans_msg)
            rospy.loginfo("Published Combined Transform on odom1")
        
        rate.sleep()

if __name__ == '__main__':
    listener()