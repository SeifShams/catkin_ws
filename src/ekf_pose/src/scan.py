#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import LaserScan

def scan_callback(msg):
    # Modify the scan data
    # The SICK S300 Expert has a typical range of up to 30 meters,
    # but for safety applications, the range is limited to 5.5 meters.
    # Let's filter out ranges greater than 5.5 meters to fit the safety application range
    max_range = 5.5  # Adjust this value as per your application's requirement
    msg.ranges = [min(r, max_range) if r > 0 else 0 for r in msg.ranges]
    
    # It's also common to adjust intensities if your application requires it,
    # but since the S300 does not provide intensity data, we'll skip this step.
    
    # Publish the modified scan data
    scan_pub.publish(msg)

# Initialize the node
rospy.init_node('sick_s300_scan_modifier')

# Create a subscriber for the laser scans
scan_sub = rospy.Subscriber('/scan', LaserScan, scan_callback)

# Create a publisher for the modified laser scans
scan_pub = rospy.Publisher('/sick_s300_modified_scan', LaserScan, queue_size=10)

# Spin to keep the script from exiting
rospy.spin()
