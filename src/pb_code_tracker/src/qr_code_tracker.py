#!/usr/bin/env python3

import cv2
import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
from pyzbar import pyzbar

class QrDetector:
    def __init__(self):
        rospy.init_node('qr_detector')
        self.bridge = CvBridge()
        self.input_topic = rospy.get_param('~input_topic', '/rgb/image_raw')
        self.image_sub = rospy.Subscriber(self.input_topic, Image, self.callback)

    def callback(self, data):
        cv_image = self.bridge.imgmsg_to_cv2(data, 'bgr8')
        decoded_objs = pyzbar.decode(cv_image)
        for obj in decoded_objs:
            print('Type:', obj.type)
            print('Data:', obj.data)
            print('Position:', obj.rect)
            x, y, w, h = obj.rect.left, obj.rect.top, obj.rect.width, obj.rect.height
            center_x, center_y = int(x + w/2), int(y + h/2)
            print('Center:', center_x, center_y)
            cv2.rectangle(cv_image, (x, y), (x + w, y + h), (0, 0, 255), 2)
            cv2.circle(cv_image, (center_x, center_y), 3, (0, 255, 0), -1)
        cv2.imshow('QR code detector', cv_image)
        cv2.waitKey(3)

if __name__ == '__main__':
    detector = QrDetector()
    rospy.spin()