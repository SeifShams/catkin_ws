#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2

class ImageDimensionResizer:
    def __init__(self):
        self.bridge = CvBridge()

        # Get ROS parameters
        self.input_topic = rospy.get_param('~input_topic', '/rgb/image_raw')
        self.output_topic = rospy.get_param('~output_topic', '/rgb/image_resized')
        self.image_size = rospy.get_param('~image_size', (1024, 1024))
        self.image_size = eval(rospy.get_param('~image_size', '(100, 100)'))

        # Subscribe to input image topic and publish to output image topic
        self.subscriber = rospy.Subscriber(self.input_topic, Image, self.image_callback)
        self.publisher = rospy.Publisher(self.output_topic, Image, queue_size=1)

    def image_callback(self, data):
        # Convert ROS Image message to OpenCV image
        cv_image = self.bridge.imgmsg_to_cv2(data, desired_encoding='passthrough')

        
        # Resize the image
        resized_image = cv2.resize(cv_image, self.image_size, interpolation = cv2.INTER_CUBIC)

        # Convert the resized image back to ROS Image message
        output_msg = self.bridge.cv2_to_imgmsg(resized_image, encoding='passthrough')

        # Publish the resized image
        self.publisher.publish(output_msg)

if __name__ == '__main__':
    rospy.init_node('image_dimension_resizer')

    # Create ImageDimensionResizer object
    node = ImageDimensionResizer()

    # Spin the node
    rospy.spin()
