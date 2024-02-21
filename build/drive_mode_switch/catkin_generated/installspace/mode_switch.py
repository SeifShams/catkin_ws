#!/usr/bin/env python3
import rospy
from rospy import client
import std_msgs
import sys
import dynamic_reconfigure.client


#roslib.load_manifest(#TebLocalPlanner)
#)


def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
       
    client = dynamic_reconfigure.client.Client("/move_base/TebLocalPlannerROS")
    client2 = dynamic_reconfigure.client.Client("/move_base")
    client3 = dynamic_reconfigure.client.Client("move_base/local_costmap")

    param_TEB_trailer = {
        #"holonomic_robot": False,
        #GoalTolerance: nothing changes
        "xy_goal_tolerance": 0.15,
        #HCPlanning: nothing changes
        "selection_cost_hysteresis": 1.5,
        #Obstacles:
        "min_obstacle_dist": 0.5,
        "inflation_dist": 0.6,
        #Optimization:
        "weight_kinematics_nh": 10000,
        "weight_kinematics_forward_drive": 1000,
        "weight_kinematics_turning_radius": 1000,
        "weight_optimaltime": 100,
        "weight_shortest_path": 0.0,
        #Recovery: nothing changes
        #Robot:
        "acc_lim_x": 0.4,
        "acc_lim_y": 0.01,
        "acc_lim_theta": 0.7,
        "max_vel_x_backwards": 0.11,
        "min_turning_radius": 3.5,
        "wheelbase": 1.10,
        "max_vel_y": 0.0,
        #Trajectory:
        "dt_ref": 0.1,
        "dt_hysteresis": 0.01,
        "max_global_plan_lookahead_dist": 7.0,
        "allow_init_with_backwards_motion": False,
      
    }

    param_TEB_solo = {
        #"holonomic_robot": True,
        #GoalTolerance: nothing changes
        #HCPlanning: nothing changes
        #Obstacles:
        "min_obstacle_dist": 0.1,
        "inflation_dist": 0.0,
        #Optimization:
        "weight_kinematics_nh": 2,
        "weight_kinematics_forward_drive": 1,
        "weight_kinematics_turning_radius": 0,
        "weight_optimaltime": 0.5,
        "weight_shortest_path": 2.0,
        #Recovery: nothing changes
        #Robot:
        "acc_lim_x": 0.4,
        "acc_lim_y": 0.4,
        "acc_lim_theta": 0.7,
        "max_vel_x_backwards": 1.0,
        "min_turning_radius": 0.0,
        "wheelbase": 1.0,
        "max_vel_y": 1.0,
        #Trajectory
        "dt_ref": 0.1,
        "dt_hysteresis": 0.01,
        "max_global_plan_lookahead_dist": 1.0,
        "allow_init_with_backwards_motion": True,

    }

    param_globalplanner_trailer = {
        "base_global_planner": "SBPLLatticePlanner",
        "clearing_rotation_allowed": False,
        "recovery_behavior_enabled": False,
    }

    param_globalplanner_solo = {
        "base_global_planner": "navfn/NavfnROS",
        "clearing_rotation_allowed": True,

    }

    param_localcostmap_trailer = {
        "width": 7,
        "height": 7,
        "footprint_padding": 0.1,
        
    }

    #param_globalcostmap_trailer = {
     #   "width": 7,
      #  "height": 7,
       # "footprint_padding": 0.1,
        
    #}
    
    param_localcostmap_solo = {
        "width": 7,
        "height": 7,
    }    

    
    mode = data.data

    if (mode):

        client.update_configuration(param_TEB_trailer)
        client2.update_configuration(param_globalplanner_trailer)
        client3.update_configuration(param_localcostmap_trailer)
        

    else:
        client.update_configuration(param_TEB_solo)
        client2.update_configuration(param_globalplanner_solo)
        client3.update_configuration(param_localcostmap_solo)

        

def mode_switch():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('mode_switch', anonymous=True)

    rospy.Subscriber("/mode", std_msgs.msg.Bool, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    mode_switch()