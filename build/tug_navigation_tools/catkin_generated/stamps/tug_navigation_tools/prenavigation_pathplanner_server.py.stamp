#!/usr/bin/env python3
from typing import TypedDict

import matplotlib.pyplot as plt
import numpy as np
import rospy
from geometry_msgs.msg import PoseStamped, Twist
from klampt.model import trajectory
from nav_msgs.msg import Odometry, Path
from tf.transformations import euler_from_quaternion

from tug_navigation_tools.msg import EmergencyStop, AccelerationStamped
from tug_navigation_tools.srv import (PrenavigationPathplanner,
                                      calculate_rotation)


class ControlParams(TypedDict):
    # slowness factor determines how fast the robot will drive
    # initially set to 0.06, if factor is smaller the robot will drive faster,
    # if the factor is larger the robot will drive slower.
    slowness_factor: float
    emergency_stop: bool


class RecentOdomState(TypedDict):
    x_map: float
    y_map: float
    phi_map: float
    dx_robot: float
    dphi_robot: float


class GoalPosition(TypedDict):
    x_map: float
    y_map: float
    phi_map: float


class plannedPath(TypedDict):
    x_positions_map: list
    y_positions_map: list


class plannedTrajectory(TypedDict):
    x_positions_map: list
    y_positions_map: list
    phi_positions_map: list
    l_increments_robot: list
    phi_increments_robot: list
    dl_velocities_robot: list
    dphi_velocities_robot: list
    time_steps: list
    time_step_length: float


class actualTrajectory(TypedDict):
    x_positions_map: list
    y_positions_map: list
    l_deviationToPlan_map: list
    dl_velocities_robot: list
    dphi_velocities_robot: list


class PublisherSubscribers(TypedDict):
    emergency_stop_subscriber: rospy.Subscriber
    odom_subscriber: rospy.Subscriber
    # pose_subscriber: rospy.Subscriber
    velocity_publisher: rospy.Publisher
    path_publisher: rospy.Publisher
    future_velocity_publisher: rospy.Publisher


class CreateNavigation():

    def __init__(self) -> None:
        self.controlparams = ControlParams(slowness_factor=0.06, emergency_stop=False)
        self.params = ControlParams(emergency_stop=False,)
        self.recentodomstate = RecentOdomState(x_map=0., y_map=0., phi_map=0., dx_robot=0., dphi_robot=0.)
        self.goalposition = GoalPosition(x_map=0., y_map=0., phi_map=0.)
        self.plannedpath = plannedPath(x_positions_map=[], y_positions_map=[])
        self.plannedtrajectory = plannedTrajectory(
            x_positions_map=[],
            y_positions_map=[],
            phi_positions_map=[],
            l_increments_robot=[],
            phi_increments_robot=[],
            dl_velocities_robot=[],
            dphi_velocities_robot=[],
            time_steps=[0],
            time_step_length=0
        )

        self.expectedtrajectory = plannedTrajectory(
            x_positions_map=[],
            y_positions_map=[],
            phi_positions_map=[],
            l_increments_robot=[0],
            phi_increments_robot=[0],
            dl_velocities_robot=[0],
            dphi_velocities_robot=[0],
            time_steps=[0],
            time_step_length=0
        )
        self.actualtrajectory = plannedTrajectory(
            x_positions_map=[],
            y_positions_map=[],
            l_deviationToPlan_map=[],
            dl_velocities_robot=[],
            dphi_velocities_robot=[]
        )

        try:
            self.publishers_subscribers = PublisherSubscribers(
                odom_subscriber=rospy.Subscriber("/odom", Odometry, self.odom_callback),
                emergency_stop_subscriber=rospy.Subscriber("/emergency_stop", EmergencyStop, self.emergency_callback),
                velocity_publisher=rospy.Publisher("/cmd_vel", Twist, queue_size=10),
                path_publisher=rospy.Publisher("/smooth_path", Path, queue_size=1),
                future_velocity_publisher=rospy.Publisher("/future_movements", AccelerationStamped, queue_size=10)
            )
        except rospy.ROSInterruptException:
            pass

        rospy.Service(
            "/tug_navigation_tools/prenavigation_pathplanning",
            PrenavigationPathplanner,
            self.handle_prenavigation_pathplanning_command
        )
        rospy.Service("/calculate_initial_rotation", calculate_rotation, self.handle_calculate_rotation)
        rospy.loginfo("Server running")

    def odom_callback(self, data: Odometry):
        self.recentodomstate["x_map"] = float(data.pose.pose.position.x)
        self.recentodomstate["y_map"] = float(data.pose.pose.position.y)
        _, _, self.recentodomstate["phi_map"] = euler_from_quaternion(
            [data.pose.pose.orientation.x,
             data.pose.pose.orientation.y,
             data.pose.pose.orientation.z,
             data.pose.pose.orientation.w]
        )
        self.recentodomstate["dx_robot"] = float(data.twist.twist.linear.x)
        self.recentodomstate["dphi_robot"] = float(data.twist.twist.angular.z)

    def emergency_callback(self, received_data: EmergencyStop):
        self.params["emergency_stop"] = received_data.stop_cmd
        rospy.loginfo(f"EMERGENCY STOP: Status = {received_data.stop_cmd}")
        self.publishers_subscribers["velocity_publisher"].publish(Twist())

    def get_move_base_path(self, req: Path):
        counter = 0
        # take every 10 milestone
        for pose in req.poses:
            if counter % 10 == 0 or counter == len(req.poses) - 1:
                self.plannedpath["x_positions_map"].append(float(pose.pose.position.x))
                self.plannedpath["y_positions_map"].append(float(pose.pose.position.y))
            counter = counter + 1

    def transform_path_to_trajectory(self):
        # generate path in xyz plane out of global planner path
        delta_t = 0.01
        milestones = []
        velocity_factor = 50
        
        for i in range(len(self.plannedpath["x_positions_map"])):
            newMilestone = [self.plannedpath["x_positions_map"][i], self.plannedpath["y_positions_map"][i], 0]
            milestones.append(newMilestone)
        # generate a trajectory
        traj = trajectory.Trajectory(milestones=milestones)
        
        for j in range(len(milestones)):# np.linspace(0, num_milestones, num_milestones * 10):#   range(len(milestones)):
            self.plannedtrajectory["x_positions_map"].append(traj.eval(j)[0])
            self.plannedtrajectory["y_positions_map"].append(traj.eval(j)[1])
            self.plannedtrajectory["time_steps"].append(j)

        # Post processing of the given path to smoothen the curves:
        # threshold value in degrees: maximum allowed angle deviation between two vectors; 3 deg are recommended.
        # if chosen smaller e.g. 1 -> the navigability decreases: the minimum possible curve radius increases
        threshold = 2
        (check_x_positions_map, check_y_positions_map) = self.smooth_curve(
            self.plannedtrajectory["x_positions_map"], self.plannedtrajectory["y_positions_map"], threshold)

        self.plannedtrajectory["x_positions_map"] = check_x_positions_map
        self.plannedtrajectory["y_positions_map"] = check_y_positions_map

        d_x_k_minus_1 = self.plannedtrajectory["x_positions_map"][1] - self.plannedtrajectory["x_positions_map"][0]
        d_y_k_minus_1 = self.plannedtrajectory["y_positions_map"][1] - self.plannedtrajectory["y_positions_map"][0]
        l_k_minus_1 = np.sqrt(np.power(d_x_k_minus_1, 2) + np.power(d_y_k_minus_1, 2))

        phi_k_minus_1 = np.arctan2(d_y_k_minus_1, d_x_k_minus_1)
        self.plannedtrajectory["phi_positions_map"].append(phi_k_minus_1)

        # planned progression:
        self.plannedtrajectory["l_increments_robot"].append(l_k_minus_1)
        self.plannedtrajectory["phi_increments_robot"].append(0)
        # estimation of the actual progression:
        self.expectedtrajectory["l_increments_robot"].append(l_k_minus_1)
        self.expectedtrajectory["phi_increments_robot"].append(0)

        # planned progression:
        self.plannedtrajectory["dl_velocities_robot"].append(l_k_minus_1 / (delta_t * velocity_factor))
        # initial angular velocity is zero by default,
        # as it is assumed that the robot is turned to the right starting position beforehand:
        self.plannedtrajectory["dphi_velocities_robot"].append(0)

        # estimation of the actual progression:
        self.expectedtrajectory["dl_velocities_robot"].append(l_k_minus_1 / (delta_t * velocity_factor))
        # initial angular velocity is zero by default,
        # as it is assumed that the robot is turned to the right starting position beforehand:
        self.expectedtrajectory["dphi_velocities_robot"].append(0)

        for k in range(len(self.plannedtrajectory["x_positions_map"]) - 2):
            k = k + 1
            d_x_k = self.plannedtrajectory["x_positions_map"][k + 1] - self.plannedtrajectory["x_positions_map"][k]
            d_y_k = self.plannedtrajectory["y_positions_map"][k + 1] - self.plannedtrajectory["y_positions_map"][k]
            l_k = np.sqrt(np.power(d_x_k, 2) + np.power(d_y_k, 2))

            phi_k = np.arctan2(d_y_k, d_x_k)
            self.plannedtrajectory["phi_positions_map"].append(phi_k)

            angle_k = phi_k - phi_k_minus_1
            if angle_k > np.pi:
                angle_k = 2 * np.pi - angle_k

            l_k_minus_1 = l_k
            d_x_k_minus_1 = d_x_k
            d_y_k_minus_1 = d_y_k
            phi_k_minus_1 = phi_k

            # planned progression:
            self.plannedtrajectory["l_increments_robot"].append(l_k)
            self.plannedtrajectory["phi_increments_robot"].append(angle_k)

            # planned progression:
            self.plannedtrajectory["dl_velocities_robot"].append(l_k / (delta_t * velocity_factor))
            self.plannedtrajectory["dphi_velocities_robot"].append(angle_k / (delta_t * velocity_factor))

            # estimation of the actual progression:
            self.expectedtrajectory["l_increments_robot"].append(l_k)
            self.expectedtrajectory["phi_increments_robot"].append(angle_k)

            # estimation of the actual progression:
            self.expectedtrajectory["dl_velocities_robot"].append(l_k / (delta_t * velocity_factor))
            self.expectedtrajectory["dphi_velocities_robot"].append(angle_k / (delta_t * velocity_factor))
        # planned progression - stopping:
        self.plannedtrajectory["l_increments_robot"].append(0)
        self.plannedtrajectory["phi_increments_robot"].append(0)
        # planned progression - stopping:
        self.plannedtrajectory["dl_velocities_robot"].append(0)
        self.plannedtrajectory["dphi_velocities_robot"].append(0)
        # estimation of the actual progression - stopping:
        self.expectedtrajectory["l_increments_robot"].append(0)
        self.expectedtrajectory["phi_increments_robot"].append(0)
        # estimation of the actual progression - stopping:
        self.expectedtrajectory["dl_velocities_robot"].append(0)
        self.expectedtrajectory["dphi_velocities_robot"].append(0)
        # planned progression - add one step for graphical evaluation,
        # robot waits one incremental time step until final velocity and position are measured:
        self.plannedtrajectory["l_increments_robot"].append(0)
        self.plannedtrajectory["phi_increments_robot"].append(0)
        # planned progression - add one step for graphical evaluation,
        # robot waits one incremental time step until final velocity and position are measured:
        self.plannedtrajectory["dl_velocities_robot"].append(0)
        self.plannedtrajectory["dphi_velocities_robot"].append(0)

    def execute_trajectory(self):
        # Determine the step width of the control loop in ms:
        # step_width = self.controlparams["slowness_factor"]
        x_vel_speed_up_factor = 1.048  # parameter to minimize the deviation between expected and actual x-velocity
        counter = 0

        # Determine length of trajectory in meters:
        trajectory_length = 0
        for lng in range(len(self.plannedtrajectory["l_increments_robot"])):
            trajectory_length = trajectory_length + self.plannedtrajectory["l_increments_robot"][lng]

        planned_average_velocity = np.mean(self.plannedtrajectory["dl_velocities_robot"])  # in [m/s]
        planned_drive_time = trajectory_length / planned_average_velocity  # in [s]
        self.plannedtrajectory["timestep_length"] = planned_drive_time / \
            len(self.plannedtrajectory["l_increments_robot"])  # in [s]

        rospy.loginfo(
            f"START EXECUTING TRAJECTORY: \n Total length of Trajectory: {trajectory_length} m \n \
            Planned average velocity: {planned_average_velocity} m/s \n Planned drive time: {planned_drive_time}"
        )

        # ges.: t = d/v , delta_t = t/trajectory_points, f = 1/delta_t
        rate = rospy.Rate(1 / self.plannedtrajectory["timestep_length"])  # rate in [Hz]
        while counter < len(self.plannedtrajectory["time_steps"]) - 1 and self.params["emergency_stop"] is False:
            # Read out actual velocity:
            self.actualtrajectory["x_positions_map"].append(self.recentodomstate["x_map"])
            self.actualtrajectory["y_positions_map"].append(self.recentodomstate["y_map"])
            self.actualtrajectory["dl_velocities_robot"].append(self.recentodomstate["dx_robot"])
            self.actualtrajectory["dphi_velocities_robot"].append(self.recentodomstate["dphi_robot"])
            # Update the desired velocity:
            self.set_velocity(self.plannedtrajectory["dl_velocities_robot"][counter] *
                              x_vel_speed_up_factor, 0, self.plannedtrajectory["dphi_velocities_robot"][counter])
            # Optional: Calculate the deviation between planned and actual trajectory:
            # self.actualtrajectory["l_deviationToPlan_map"].append(
            #     np.sqrt(np.power(self.recentodomstate["x_map"]
            #                      - self.plannedtrajectory["x_positions_map"][counter], 2)
            #             + np.power(self.recentodomstate["y_map"]
            #                        - self.plannedtrajectory["y_positions_map"][counter], 2)))
            counter = counter + 1
            # Delay:
            rate.sleep()
        self.actualtrajectory["x_positions_map"].append(self.recentodomstate["x_map"])
        self.actualtrajectory["y_positions_map"].append(self.recentodomstate["y_map"])
        self.actualtrajectory["dl_velocities_robot"].append(self.recentodomstate["dx_robot"])
        self.actualtrajectory["dphi_velocities_robot"].append(self.recentodomstate["dphi_robot"])

    def plot_trajectory(self):
        # Initialise the subplot function using number of rows and columns
        _, axis = plt.subplots(2, 2)

        x_axis_time = [x * self.plannedtrajectory["timestep_length"] for x in self.plannedtrajectory["time_steps"]]

        axis[0, 0].plot(x_axis_time, self.plannedtrajectory["l_increments_robot"], label="planned")
        axis[0, 0].set_title("X_robot Increments")
        axis[0, 0].set_xlabel('time [s]')
        axis[0, 0].set_ylabel('relative position [m]')
        axis[0, 0].legend(shadow=True, fancybox=True)

        axis[0, 1].plot(x_axis_time, self.plannedtrajectory["phi_increments_robot"], label="planned")
        axis[0, 1].set_title("Phi_robot Increments")
        axis[0, 1].set_xlabel('time [s]')
        axis[0, 1].set_ylabel('relative angles [rad]')
        axis[0, 1].legend(shadow=True, fancybox=True)

        axis[1, 0].plot(x_axis_time, self.plannedtrajectory["dl_velocities_robot"], label="planned")
        axis[1, 0].plot(x_axis_time, self.actualtrajectory["dl_velocities_robot"], label="actual")
        axis[1, 0].plot(x_axis_time, self.expectedtrajectory["dl_velocities_robot"], label="expected")
        axis[1, 0].set_title("X_robot Velocities")
        axis[1, 0].set_xlabel('time [s]')
        axis[1, 0].set_ylabel('relative velocity [m/s]')
        axis[1, 0].legend(shadow=True, fancybox=True)

        axis[1, 1].plot(x_axis_time, self.plannedtrajectory["dphi_velocities_robot"], label="planned")
        axis[1, 1].plot(x_axis_time, self.actualtrajectory["dphi_velocities_robot"], label="actual")
        axis[1, 1].plot(x_axis_time, self.expectedtrajectory["dphi_velocities_robot"], label="expected")
        axis[1, 1].set_title("Phi_robot Velocities")
        axis[1, 1].set_xlabel('time [s]')
        axis[1, 1].set_ylabel('angular velocity [rad/s]')
        axis[1, 1].legend(shadow=True, fancybox=True)
        plt.show()

        x_axis_time.pop(-1)
        _, axis2 = plt.subplots(1, 2)
        axis2[0].plot(self.plannedtrajectory["x_positions_map"],
                      self.plannedtrajectory["y_positions_map"], 'b-o', label="planned")
        axis2[0].plot(self.actualtrajectory["x_positions_map"],
                      self.actualtrajectory["y_positions_map"], 'g-o', label="actual")
        axis2[0].set_title("Absolute Positions")
        axis2[0].set_xlabel('x-position [m]')
        axis2[0].set_ylabel('y-position [m]')
        axis2[0].legend(shadow=True, fancybox=True)

        axis2[1].plot(x_axis_time, self.actualtrajectory["l_deviationToPlan_map"])
        axis2[1].set_title("Deviations of Absolute Position")
        axis2[1].set_xlabel('time [s]')
        axis2[1].set_ylabel('deviation [m]')
        plt.show()

    def print_deviation(self):
        lin_velocity_difference = np.asarray(self.actualtrajectory["dl_velocities_robot"]) \
            - np.asarray(self.expectedtrajectory["dl_velocities_robot"])
        # calculate velocity average deviation:
        lin_vel_ave_dev = np.average(lin_velocity_difference)
        # calculate velocity standard deviation:
        lin_vel_std_dev = np.std(lin_velocity_difference)
        # calculate velocity maximum deviation:
        lin_vel_max_dev = np.amax(np.abs(lin_velocity_difference))
        rospy.loginfo(
            f"LINEAR VELOCITY [m/s]: \n average deviation: {lin_vel_ave_dev} \n \
            standard deviation: {lin_vel_std_dev} \n absolute maximum deviation: {lin_vel_max_dev}"
        )

        ang_velocity_difference = np.asarray(self.actualtrajectory["dphi_velocities_robot"]) \
            - np.asarray(self.expectedtrajectory["dphi_velocities_robot"])
        # calculate velocity average deviation:
        ang_vel_ave_dev = np.average(ang_velocity_difference)
        # calculate velocity standard deviation:
        ang_vel_std_dev = np.std(ang_velocity_difference)
        # calculate velocity maximum deviation:
        ang_vel_max_dev = np.amax(np.abs(ang_velocity_difference))
        rospy.loginfo(
            f"ANGULAR VELOCITY [rad/s]: \n average deviation: {ang_vel_ave_dev} \
              \n standard deviation: {ang_vel_std_dev} \n absolute maximum deviation: {ang_vel_max_dev}")

        position_difference = np.asarray(self.actualtrajectory["l_deviationToPlan_map"])
        # calculate position average deviation:
        pos_ave_dev = np.average(position_difference)
        # calculate position standard deviation:
        pos_std_dev = np.std(position_difference)
        # calculate position maximum deviation:
        pos_max_dev = np.amax(np.abs(position_difference))
        rospy.loginfo(
            f"ABSOLUTE POSITION [m]: \n average deviation: {pos_ave_dev} \
              \n standard deviation: {pos_std_dev} \n absolute maximum deviation: {pos_max_dev}")

    def handle_prenavigation_pathplanning_command(self, req: PrenavigationPathplanner):
        """Starts the prenavigation pathplanning of the robot.

        Args:
            req (tug_navigation_tools/prenavigation_pathplanning):
                message containing information about the robots desired goal location.

        Returns:
            boolean: information about whether the robot successfully reached ist goal.
        """
        rospy.loginfo("EXECUTE Trajectory")
        self.execute_trajectory()
        # self.print_deviation()
        # self.plot_trajectory()
        # reset variables again:
        self.plannedpath = plannedPath(x_positions_map=[], y_positions_map=[])
        self.plannedtrajectory = plannedTrajectory(
            x_positions_map=[],
            y_positions_map=[],
            phi_positions_map=[],
            l_increments_robot=[],
            phi_increments_robot=[],
            dl_velocities_robot=[],
            dphi_velocities_robot=[],
            time_steps=[0],
            time_step_length=0
        )
        self.expectedtrajectory = plannedTrajectory(
            x_positions_map=[],
            y_positions_map=[],
            phi_positions_map=[],
            l_increments_robot=[0],
            phi_increments_robot=[0],
            dl_velocities_robot=[0],
            dphi_velocities_robot=[0],
            time_steps=[0],
            time_step_length=0
        )
        self.actualtrajectory = plannedTrajectory(
            x_positions_map=[],
            y_positions_map=[],
            l_deviationToPlan_map=[],
            dl_velocities_robot=[],
            dphi_velocities_robot=[]
        )
        return True

    def handle_calculate_rotation(self, req: calculate_rotation):
        self.get_move_base_path(req.path)
        self.transform_path_to_trajectory()
        return self.plannedtrajectory["phi_positions_map"][0]

    def set_velocity(self, cmd_vel_pos_x: float, cmd_vel_pos_y: float, cmd_vel_ori_z: float):
        """Publishes the passed velocity in x- and y-direction
        as well as angular as a Twist message to the rostopic 'cmd_vel'

        Args:
                        cmd_vel_pos_x (float): x-velocity in m/s
                        cmd_vel_pos_y (float): y-velocity in m/s
                        cmd_vel_ori_z (float): angular velocity
        """
        # Check the given velocities whether they are reasonable:
        vel_ori_z_bounds = (-5, 5)
        vel_pos_x_bounds = (0, 5)
        vel_pos_y_bounds = (0, 5)

        if not vel_ori_z_bounds[0] <= cmd_vel_ori_z <= vel_ori_z_bounds[1]:
            rospy.logerr(f"cmd_vel_ori_z is out of bounds {vel_ori_z_bounds}: {cmd_vel_ori_z}")

        elif not vel_pos_x_bounds[0] <= cmd_vel_pos_x <= vel_pos_x_bounds[1]:
            rospy.logerr(f"cmd_vel_pos_x is out of bounds {vel_pos_x_bounds}: {cmd_vel_pos_x}")

        elif not vel_pos_y_bounds[0] <= cmd_vel_pos_y <= vel_pos_y_bounds[1]:
            rospy.logerr(f"cmd_vel_pos_y is out of bounds {vel_pos_y_bounds}: {cmd_vel_pos_y}")
        else:
            
            vel_command = Twist()
            vel_command.linear.x = cmd_vel_pos_x
            vel_command.linear.y = cmd_vel_pos_y
            vel_command.angular.z = cmd_vel_ori_z
            self.publishers_subscribers["velocity_publisher"].publish(vel_command)     

    def smooth_curve(self, x_position_list, y_position_list, phi_threshold):
        """Smoothes a curve given by points in an x-,y-plane. The

        Args:
                        x_position_list (list): x-positions of the points that define the curve, in m
                        y_position_list (list): y-positions of the points that define the curve, in m
                        phi_threshold (float): allowed angular deviation between two curve parts, in deg
        """
        phi_threshold = phi_threshold * np.pi / 180
        j = 1
        # limits the times thee loop runs through, in case there is no converging solution
        run = (len(x_position_list) - 1) * 100
        while (j < (len(x_position_list) - 1)) and run > 0:
            dx_j_minus_1 = x_position_list[j] - x_position_list[j - 1]
            dy_j_minus_1 = y_position_list[j] - y_position_list[j - 1]
            dx_j = x_position_list[j + 1] - x_position_list[j]
            dy_j = y_position_list[j + 1] - y_position_list[j]
            gamma_j_minus_1 = np.arctan2(dy_j_minus_1, dx_j_minus_1)
            gamma_j = np.arctan2(dy_j, dx_j)
            alpha = gamma_j_minus_1 - gamma_j
            if alpha > np.pi:
                alpha = 2 * np.pi - alpha

            if abs(alpha) > phi_threshold:
                x_position_list[j] = x_position_list[j - 1] + 0.5 * (dx_j_minus_1 + dx_j)
                y_position_list[j] = y_position_list[j - 1] + 0.5 * (dy_j_minus_1 + dy_j)
                if j > 1:
                    j = j - 1
            else:
                j = j + 1
            run = run - 1
        if run == 0:
            rospy.logerr("Curve fitting algorithm did not converge. Smoothing of the trajectory aborted!")

        self.publish_path(x_position_list, y_position_list)

        return (x_position_list, y_position_list)

    def publish_path(self, x_position_list, y_position_list):
        path = Path()
        path.header.seq = 0
        path.header.frame_id = "map"
        path.header.stamp = rospy.Time(0)
        for x, y in zip(x_position_list, y_position_list):
            pose = PoseStamped()
            pose.header.seq = 0
            pose.header.frame_id = "map"
            pose.header.stamp = rospy.Time(0)
            pose.pose.position.x = x
            pose.pose.position.y = y
            pose.pose.position.z = 0
            pose.pose.orientation.x = 0
            pose.pose.orientation.y = 0
            pose.pose.orientation.z = 0
            pose.pose.orientation.w = 0
            path.poses.append(pose)
        self.publishers_subscribers["path_publisher"].publish(path)


if __name__ == '__main__':
    rospy.init_node("prenavigation_pathplanning", anonymous=False)
    positioning_robot = CreateNavigation()
    rospy.spin()
