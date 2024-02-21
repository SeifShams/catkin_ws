#!/usr/bin/env python3

from __future__ import print_function

import sys
import rospy

from tug_navigation_tools.srv import parking_position


def set_new_parallel_parking_pos(x_pos, y_pos, wall_distance):
    rospy.wait_for_service('get_parking_position')
    try:
        get_new_parking_position = rospy.ServiceProxy('get_parking_position', parking_position)
        response = get_new_parking_position(x_pos, y_pos, wall_distance)
        return response
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)



if __name__ == "__main__":
    if len(sys.argv) == 4:
        x_pos = int(sys.argv[1])
        y_pos = int(sys.argv[2])
        wall_distance = float(sys.argv[3])
    else:
        print("Invalid number of parameters.")
        sys.exit(1)
    response = set_new_parallel_parking_pos(x_pos, y_pos, wall_distance)
    print("New valid position found ?: " + str(response.position_found))
    print("Position at: " + str(response.new_parking_position))

