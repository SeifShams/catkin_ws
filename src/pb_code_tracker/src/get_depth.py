#!/usr/bin/env python3

import rospy
import numpy as np
from sensor_msgs import point_cloud2
from sensor_msgs.msg import PointCloud2

class PointCloudProcessor(object):

    def __init__(self):

        self.pc_sub = rospy.Subscriber('/points2', PointCloud2, self.pc_callback)
        self.pc = None

    def pc_callback(self, msg):
        point_generator= point_cloud2.read_points(msg, skip_nans=True, field_names=("x", "y", "z"))
        self.pc = np.array(list(point_generator))

    def get_depth(self, x, y):

        if self.pc is None:
            return None

        # Extract the corresponding 3D point from the point cloud
        row = 1536
        idx = (row * y) + x
        print ("Idx", idx)
        
        point = self.pc[(row * y) + x]
        print("Point", point)
        #point = np.append(point, [1])
        #point = self.pc[int(x), int(y)]

        ## Return the depth of the point
        #return point[2]

if __name__ == '__main__':

    rospy.init_node('point_cloud_processor')
    pc_processor = PointCloudProcessor()

    # Read in the 2D point from user input (in pixel coordinates)
    x = int(input("Enter the x-coordinate of the point: "))
    y = int(input("Enter the y-coordinate of the point: "))

    # Get the depth of the corresponding 3D point in the point cloud
    depth = pc_processor.get_depth(x, y)

    #if depth is None:
    #    rospy.logerr("Point cloud not yet received!")
    #else:
    #    rospy.loginfo("Depth of point ({}, {}): {}".format(x, y, depth))

    rospy.spin()
