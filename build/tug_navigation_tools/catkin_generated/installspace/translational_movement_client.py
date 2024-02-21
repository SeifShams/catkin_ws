#!/usr/bin/env python3

from __future__ import print_function

import sys
import rospy
from tug_navigation_tools.srv import *

def set_new_position_client(back_and_forth, side_to_side):
    rospy.wait_for_service('set_translational_movement')
    try:
        set_new_position = rospy.ServiceProxy('set_translational_movement', translational_movement)
        response = set_new_position(back_and_forth, side_to_side)
        return response.reached
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def usage():
    return "%s [back_and_forth, side_to_side]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 3:
        back_and_forth = float(sys.argv[1])
        side_to_side = float(sys.argv[2])
    else:
        print(usage())
        sys.exit(1)
    print("Position reached %s"%set_new_position_client(back_and_forth, side_to_side))
