#!/usr/bin/env python3
import sys
import rospy

from tug_navigation_tools.srv import FinePositioning


def start_fine_positioning(parking_pos, goal_dist, initial_dist):
    rospy.wait_for_service("/tug_navigation_tools/fine_positioning")
    try:
        new_fine_positioning_service = rospy.ServiceProxy("/tug_navigation_tools/fine_positioning", FinePositioning)
        return new_fine_positioning_service(parking_pos, goal_dist, initial_dist)
    except rospy.ServiceException as e:
        print(f"Service call failed: {e}")
        return False


if __name__ == "__main__":
    if len(sys.argv) == 4:
        wall_position = int(sys.argv[1])
        goal_distance = float(sys.argv[2])
        initial_distance = float(sys.argv[3])
    else:
        print("Invalid number of parameters! Required: wall_position wall_distance")
        sys.exit(1)
    response = start_fine_positioning(wall_position, goal_distance, initial_distance)
    print("Fine positioning finished")
