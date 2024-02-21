#!/usr/bin/env python3
from turtle import distance
import numpy as np
import rospy
from sensor_msgs.msg import LaserScan
import numpy as np


class FilterScan():

    def __init__(self):
        self.scan_subscriber = rospy.Subscriber("/scan_rear_right", LaserScan, self.scan_filter)
        self.scan_publisher = rospy.Publisher("/scan_rear_right_filtered", LaserScan, queue_size=10)

    def scan_filter(self, received_data: LaserScan):
        """Stores the scan values, updates global variables, such that the current Lidar Data is always accessible

        Args:
                        received_data (sensor_msgs/LaserScan): 360 degree LaserScan of the robots environment
        """

        angle_min = received_data.angle_min
        angle_max = received_data.angle_max
        scans = np.array(received_data.ranges)
        angle_number = len(scans)
        angles = np.linspace(angle_min, angle_max, angle_number)
        distances = self.compute_distances(scans, angles)
        filter_range_short_side = np.logical_and(np.degrees(angles) - np.degrees(-2.356194496154785) < 5, scans < 1.05)
        filter_range_long_side = np.logical_and(np.degrees(2.356194496154785) - np.degrees(angles) < 5, scans < 1.8)
        filter_range_total = np.logical_or(filter_range_short_side, filter_range_long_side)
        distance_filter = np.logical_and(distances < 1.2, distances > 0.6)
        filter_idx = np.logical_and(filter_range_total, distance_filter)
        idx = np.where(filter_idx)[0]
        scans[idx] = np.inf
        received_data.ranges = list(scans)
        now = rospy.get_rostime()
        received_data.header.stamp.secs = now.secs
        received_data.header.stamp.nsecs = now.nsecs
        self.scan_publisher.publish(received_data)

    def compute_distances(self, scans, angles):
        angles = np.array(angles)
        scans = np.array(scans)
        idx = np.where(scans == np.inf)
        scans[idx] = 9999
        distances = abs(np.sin(angles) * scans)
        distances[idx] = np.inf
        return distances


if __name__ == "__main__":
    rospy.init_node("filter_scan", anonymous=False)
    pub_sub = FilterScan()
    rospy.spin()
