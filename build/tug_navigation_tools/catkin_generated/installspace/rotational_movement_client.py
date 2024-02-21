#!/usr/bin/env python3

from __future__ import print_function

import sys
import rospy

from tug_navigation_tools.srv import *

def set_new_angle_client(angle):
    rospy.wait_for_service('set_rotational_movement')
    try:
        set_new_angle = rospy.ServiceProxy('set_rotational_movement', rotational_movement)
        response = set_new_angle(angle)
        return response
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def usage():
    return "%s [angle]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 2:
        angle = float(sys.argv[1])
    else:
        print(usage())
        sys.exit(1)
    print("Position reached %s"%set_new_angle_client(angle))

