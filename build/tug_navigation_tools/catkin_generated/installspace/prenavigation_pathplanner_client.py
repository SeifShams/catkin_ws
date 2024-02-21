#!/usr/bin/env python3
import sys
import rospy
import numpy as np
from tug_navigation_tools.srv import PrenavigationPathplanner, rotate_to_angle, calculate_rotation
from nav_msgs.srv import GetPlan
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import PoseWithCovarianceStamped
from nav_msgs.msg import Odometry
from nav_msgs.msg import Path


def call_move_base(x_pos, y_pos):
    msg = rospy.wait_for_message("/amcl_pose", PoseWithCovarianceStamped, timeout=None)
    start = PoseStamped()
    start.header.seq = 0
    start.header.frame_id = "map"
    start.header.stamp = rospy.Time(0)
    start.pose.position.x = float(msg.pose.pose.position.x)
    start.pose.position.y = float(msg.pose.pose.position.y)

    Goal = PoseStamped()
    Goal.header.seq = 0
    Goal.header.frame_id = "map"
    Goal.header.stamp = rospy.Time(0)
    Goal.pose.position.x = float(x_pos)
    Goal.pose.position.y = float(y_pos)

    req = GetPlan()
    req.start = start
    req.goal = Goal
    req.tolerance = .5
    rospy.wait_for_service("/move_base/make_plan")
    try:
        get_path = rospy.ServiceProxy('/move_base/make_plan', GetPlan)
        Response = get_path(req.start, req.goal, req.tolerance)
        print(len(Response.plan.poses))
        return Response.plan
    except rospy.ServiceException as e:
        print(f"Move_base call failed: {e}")
        return False


def call_rotate_to_angle(phi_ori):
    req = rotate_to_angle()
    req.desired_phi = phi_ori
    rospy.wait_for_service("/rotate_to_angle_service")
    try:
        rotate_to_angle_service = rospy.ServiceProxy("/rotate_to_angle_service", rotate_to_angle)
        return rotate_to_angle_service(req.desired_phi)
    except rospy.ServiceException as e:
        print(f"Service call failed: {e}")
        return False   


def call_calculate_rotation(path: Path):
    req = calculate_rotation()
    req.path = path
    rospy.wait_for_service("/calculate_initial_rotation")
    try:
        calculate_rotation_service = rospy.ServiceProxy("/calculate_initial_rotation", calculate_rotation)
        response = calculate_rotation_service(req.path)
        return response.angle
    except rospy.ServiceException as e:
        print(f"Service call failed: {e}")
        return False


def execute_trajectory():
    rospy.wait_for_service("/tug_navigation_tools/prenavigation_pathplanning")
    try:
        new_prenavigation_pathplanning_service = rospy.ServiceProxy("/tug_navigation_tools/prenavigation_pathplanning", PrenavigationPathplanner)
        new_prenavigation_pathplanning_service()
    except rospy.ServiceException as e:
        print(f"Service call failed: {e}")


def start_prenavigation_pathplanning(x_pos, y_pos, phi_ori):
    #1. call move base to get path
    path = call_move_base(x_pos, y_pos)
    #2. call calculate rotation
    angle = call_calculate_rotation(path)
    #3. execute rotation
    call_rotate_to_angle(angle)
    #4. execute trajectory
    execute_trajectory()
    #5. execute rotation
    return call_rotate_to_angle(phi_ori)



if __name__ == "__main__":
    rospy.init_node("prenavigation_pathplanning_client", anonymous=False)
    if len(sys.argv) == 4:
        x_pos = float(sys.argv[1])
        y_pos = float(sys.argv[2])
        phi_ori = float(sys.argv[3])
    else:
        print("Invalid number of parameters! Required: x_pos y_pos phi_ori")
        sys.exit(1)
    response = start_prenavigation_pathplanning(x_pos, y_pos, phi_ori)
    rospy.loginfo("Prenavigation pathplanning finished.")
