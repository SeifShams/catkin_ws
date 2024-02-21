#!/usr/bin/env python3
from typing import TypedDict
import itertools
import numpy as np
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from tug_navigation_tools.msg import EmergencyStop
from tug_navigation_tools.srv import FinePositioning

# This programm starts a server to which a desired distance to a wall can be passed
# that then positions the robot parallel to the wall in the specified distance.
# Requires the robot to already be approximately positioned in the desired
# position. Remaining small distance and angular deviations can then be
# corrected automatically.

# Explanation of fine positioning approach:
# Once a new desired parking distance is passed, the distance and angle deviation of the desired position is calculated every time step.
# Based on the deviations the error is measured and the motors are controlled via a PID controller.
# The exact position of the robot relative to the table is determined by
# constantly reading out the laser scan.

# This program requires the desired wall distance d and the side where the wall is supposed to be xc(starboard o port side).
# If the position has been reached succesfully True will be returned,
# otherwise False


class AngleParams(TypedDict):
    incr: float
    number: int


class Distances(TypedDict):
    goal: float
    current: float
    initial: float


class ControlVars(TypedDict):
    distances_to_target: np.ndarray
    positions_along_robot: np.ndarray
    current_angle: float


class ControlParams(TypedDict):
    min_idx: int
    max_idx: int
    parking_side: int
    robot_width: float
    robot_length: float
    emergency_stop: bool
    move_closer: int


class Angles(TypedDict):
    all_scans: np.ndarray
    parking_scans: np.ndarray
    parking_scans_degrees: np.ndarray


class Scans(TypedDict):
    all_scans: np.ndarray
    parking_scans: np.ndarray


class PublisherSubscribers(TypedDict):
    scan_subscriber: rospy.Subscriber
    emergency_stop_subscriber: rospy.Subscriber
    velocity_publisher: rospy.Publisher


class PositionRobot():

    def __init__(self) -> None:
        self.distances = Distances(goal=0., current=0., initial=0.)
        self.angle_params = AngleParams(incr=0.000578, number=1084)
        self.control_vars = ControlVars(distances_to_target=np.array([0]), positions_along_robot=np.array([0]), current_angle=1000.)

        self.params = ControlParams(
            max_idx=self.angle_params["number"] - 1,
            min_idx=0,
            robot_length=1.7,
            robot_width=1.,
            parking_side=1,
            emergency_stop=False,
            move_closer=1,
        )

        self.angles = Angles(all_scans=np.array([0]), parking_scans=np.array([0]), parking_scans_degrees=np.array([0]))
        self.scans = Scans(all_scans=np.array([0]), parking_scans=np.array([0]))

        try:
            self.publishers_subscribers = PublisherSubscribers(
                scan_subscriber=rospy.Subscriber("/scan", LaserScan, self.scan_callback),
                emergency_stop_subscriber=rospy.Subscriber("/emergency_stop", EmergencyStop, self.emergency_callback),
                velocity_publisher=rospy.Publisher("/cmd_vel", Twist, queue_size=10)
            )
        except rospy.ROSInterruptException:
            pass

        rospy.Service("/tug_navigation_tools/fine_positioning", FinePositioning, self.handle_fine_positioning_command)
        rospy.loginfo("Server running")

    def reset_attrs(self):
        self.distances["goal"] = 0.
        self.distances["current"] = 0.
        self.distances["initial"] = 0.

        self.angle_params["incr"] = 0.000578
        self.angle_params["number"] = 1084

        self.control_vars["distances_to_target"] = np.array([0])
        self.control_vars["positions_along_robot"] = np.array([0])
        self.control_vars["current_angle"] = 1000.

        self.params["max_idx"] = self.angle_params["number"] - 1
        self.params["min_idx"] = 0
        self.params["move_closer"] = 1

    def emergency_callback(self, received_data: EmergencyStop):
        self.params["emergency_stop"] = received_data.stop_cmd
        self.publishers_subscribers["velocity_publisher"].publish(Twist())

    def scan_callback(self, received_data: LaserScan):
        """Stores the scan values, updates global variables, such that the current Lidar Data is always accessible

        Args:
                        received_data (sensor_msgs/LaserScan): 360 degree LaserScan of the robots environment
        """

        self.scans["all_scans"] = np.array(received_data.ranges)
        self.angle_params["incr"] = received_data.angle_increment
        self.angle_params["number"] = len(self.scans["all_scans"])
        angle_min = received_data.angle_min
        angle_max = received_data.angle_max
        self.angles["all_scans"] = np.linspace(angle_min, angle_max, self.angle_params["number"])

    def handle_fine_positioning_command(self, req: FinePositioning):
        """Starts the fine positioning of the robot.

        Args:
                        req (tug_navigation_tools/fine_positioning): message containing information about the desired distance
                                                                     to the wall and the position of the wall relative to the robot.

        Returns:
                        boolean: information about whether the robot was successfully positioned.
        """

        rospy.loginfo("fine_positioning_().server: handle_fine_positioning_command")
        self.distances["goal"] = float(req.goal_distance)
        self.distances["initial"] = float(req.initial_distance)
        self.distances["current"] = self.distances["initial"]  # in the beginning current distance is given initial distance
        if self.distances["goal"] > self.distances["initial"]:
            self.params["move_closer"] = -1

        self.params["parking_side"] = int(req.wall_position)

        # [rad]; Acceptable remaining angle deviation
        angle_diff_tolerance = np.deg2rad(0.5)
        # [m]; Maximum tranlateral error. ...
        translateral_diff_tolerance = 0.001
        # ... The final distance to the wall must not be larger than the desired wall distance ...
        # ... and not smaller than the desired wall distance minus the translateral_minimize_translateral_deviationdiff_tolerance.

        # Minimize the lidar search space:
        try:
            self.set_min_max_array_values()
            rospy.sleep(1)
            self.calculate_distance_to_goal()
            self.calculate_current_angle()
            translateral_deviation_corrected = True
            angle_deviation_corrected = True

            while (translateral_deviation_corrected is True) or (angle_deviation_corrected is True):
                if self.params["emergency_stop"] is True:
                    self.set_velocity(0, 0, 0)
                    rospy.loginfo("Emergency Stop activated! Fine positioning aborted")
                    self.reset_attrs()
                    return False
                angle_deviation_corrected = self.minimize_angle_deviation(angle_diff_tolerance)
                translateral_deviation_corrected = self.minimize_translateral_deviation(translateral_diff_tolerance)
            self.reset_attrs()
            return True
        except Exception as e:
            rospy.logerr(e)
            self.reset_attrs()
            return False

    def calculate_distance_to_goal(self):

        def filter_entries(filter_idxs):

            # get valid entries for distances to target, position along robot and angles in degrees
            self.control_vars["distances_to_target"] = self.control_vars["distances_to_target"][filter_idxs]
            self.control_vars["positions_along_robot"] = self.control_vars["positions_along_robot"][filter_idxs]
            self.angles["parking_scans_degrees"] = np.degrees(self.angles["parking_scans"])[filter_idxs]

        # get all angles and scans in current scan window
        self.angles["parking_scans"] = self.angles["all_scans"][self.params["min_idx"]:self.params["max_idx"]]
        self.scans["parking_scans"] = self.scans["all_scans"][self.params["min_idx"]:self.params["max_idx"]]

        # calculate vertical distances to detecte target of all scans and the horizontal distance of the scanner center
        # to their intersection with robot' x-axis
        self.control_vars["distances_to_target"] = abs(np.sin(self.angles["parking_scans"]) * self.scans["parking_scans"])
        self.control_vars["positions_along_robot"] = abs(np.cos(self.angles["parking_scans"]) * self.scans["parking_scans"])

        # get idxs of of entries where vertical distance to target is within 50 cm of previously determined distance (or initial distance)
        filter_idxs = np.where(abs(self.control_vars["distances_to_target"] - self.distances["current"] - self.params["robot_width"] / 2) < 0.5)[0]
        filter_entries(filter_idxs)
        # rospy.loginfo(f"Current distance: {self.distances['current']}")

    def calculate_current_angle(self):

        def calculate_angle(x_1: np.ndarray, x_2: np.ndarray, y_1: np.ndarray, y_2: np.ndarray) -> np.ndarray:
            d_x = abs(x_1 - x_2)
            d_y = y_1 - y_2
            return np.arctan2(d_y, d_x)

        # get indicies of angle entries of more and less than 90 degrees
        idx_angles_large = np.where(self.angles["parking_scans_degrees"] > 91.)[0]
        idx_angles_small = np.where(self.angles["parking_scans_degrees"] < 91.)[0]

        # check wether there are more angles above or below 90 degrees and choose larger array of indicies
        idx_angles = idx_angles_large if len(idx_angles_large) > len(idx_angles_small) else idx_angles_small

        # get positions along robot and distances to target corresponding to chosen angles
        positions_along_robot_filtered = self.control_vars["positions_along_robot"][idx_angles]
        distances_to_target_filtered = self.control_vars["distances_to_target"][idx_angles]

        # create array of all possible idxs and create all possible combinations
        num_positions = len(idx_angles)
        idxs = range(num_positions)
        all_idx = list(itertools.product(idxs, idxs))
        all_idx = np.array(all_idx)

        # throw out all combinations where the second index is less than 5 greater than the first --> only compare larger idxs to smaller
        all_idx = all_idx[np.where(all_idx[:, 1] - all_idx[:, 0] > 5)[0], :]

        # create arrays that contain als x and y positions of the points used to calculate the angle
        x1s = positions_along_robot_filtered[all_idx[:, 0]]
        x2s = positions_along_robot_filtered[all_idx[:, 1]]
        y1s = distances_to_target_filtered[all_idx[:, 0]]
        y2s = distances_to_target_filtered[all_idx[:, 1]]

        # calculate all angles and filter them
        angles: np.ndarray = calculate_angle(x1s, x2s, y1s, y2s)

        if abs(self.control_vars["current_angle"]) < 800.:  # checks whether an angle has already been calculated
            # if there is a previous angle compare to that* self.params["move_closer"]
            angles = angles[abs(np.degrees(angles) - np.degrees(self.control_vars["current_angle"])) < 2.5]
        else:  # if hasn't been calculated use the mediean as filter criterion
            angles = angles[abs(np.degrees(angles) - np.median(np.degrees(angles))) < 2.5]
        self.control_vars["current_angle"] = angles.mean()

    def set_min_max_array_values(self):
        """Defines the min and the max array value, in order to avoid che            e_d = self.control_vars["distances_to_target"].mean()
            self.distances["current"] = e_d - 0.5cking the whole range of the lidar scan_array.
        Only the required array_values ranging from min_idx to max_idx will be checked.
        """

        required_angle = np.arctan(self.params["robot_length"] * 0.5 / self.distances["current"])
        required_cells = round(required_angle / self.angle_params["incr"])
        if self.params["parking_side"] == 1:
            self.params["max_idx"] = int(round(self.angle_params["number"] / 4) + required_cells)
            self.params["min_idx"] = int(round(self.angle_params["number"] / 4) - required_cells)
        else:
            self.params["max_idx"] = int(round(self.angle_params["number"] * 3 / 4) + required_cells)
            self.params["min_idx"] = int(round(self.angle_params["number"] * 3 / 4) - required_cells)
        # rospy.loginfo(f"fine_positioning_server.py: min_idx = {self.min_idx}, max_idx = {self.max_idx}")

    def minimize_translateral_deviation(self, e_tolerance: float):
        """ Minimizes the translateral deviation by controlling the velocity of the robot and checking the distance to the wall

        Args:
                        e_tolerance (float): Acceptable error tolerance [m]

        Returns:
                        boolean: informs whether any position adjustments were necessary
        """

        def check_distance_to_target(tolerance: float):

            # target is reached when the mean of calcluated vertical distances corresponding to measurements
            # left and right of the center are both within tolerance
            if (self.distances["current"] - self.distances["goal"]) * self.params["move_closer"] < tolerance:  # 0.07: Break distance
                return True
            if (self.distances["current"] - self.distances["goal"]) * self.params["move_closer"] < 0.:
                return True
            return False

        # Notations for this code:
        # Angular deviations of the EiS are denoted counterclockwise ranging from:
        # 0 to Pi (if the rear is nearer to the wall than the front)
        # 0 to -Pi (if the front is nearer to the wall than the rear)

        # [deg]; delta error over one time step
        self.calculate_distance_to_goal()
        e_d = self.control_vars["distances_to_target"].mean()
        self.distances["current"] = e_d - self.params["robot_width"] / 2

        rospy.loginfo(f"minimize_translateral_deviation, e_tolerance: {e_tolerance}, e_d: {e_d}")

        rate = rospy.Rate(100)
        target_distance_reached = check_distance_to_target(e_tolerance)
        if target_distance_reached is True:
            rospy.loginfo(f"Distance target erreicht: {target_distance_reached}")
            return False
        start_time = rospy.get_time()
        while target_distance_reached is False and self.params["emergency_stop"] is False:
            # Update the error
            self.set_min_max_array_values()
            self.calculate_distance_to_goal()
            e_d = self.control_vars["distances_to_target"].mean()
            self.distances["current"] = e_d - self.params["robot_width"] / 2
            target_distance_reached = check_distance_to_target(e_tolerance)
            #v = (rospy.get_time() - start_time) * 0.5
            #v = np.min([v, 0.23])
            v = 0.3
            v = -v * self.params["parking_side"] * self.params["move_closer"]
            self.set_velocity(0, v, 0)
            # Delay 1 millisecond:
            rate.sleep()
        self.stop_movement(v)
        self.set_velocity(0, 0, 0)
        self.set_min_max_array_values()
        self.calculate_distance_to_goal()
        e_d = self.control_vars["distances_to_target"].mean()
        self.distances["current"] = e_d - self.params["robot_width"] / 2

        rospy.loginfo(f"e_d translateral end: {self.distances['current']}")

        return True

    def stop_movement(self, v_init, translateral=True, sign=None):
        rate = rospy.Rate(100)
        t_break = 0.5
        velocities = np.linspace(abs(v_init), 0., int(100 * t_break))
        for v in velocities:
            if translateral is True:
                self.set_velocity(0, -v * self.params["parking_side"] * self.params["move_closer"], 0)
            else:
                self.set_velocity(0, 0, v * sign)
            rate.sleep()
        self.set_velocity(0, 0, 0)

    def minimize_angle_deviation(self, e_tolerance: float):
        """ Minimizes the angle deviation by controlling the velocity of the robot and checking the current angle

        Args:
                        e_tolerance (float): Acceptable error tolerance [deg]

        Returns:
                        boolean: informs whether any position adjustments were necessary
        """

        # Notations for this code:
        # Angular deviations of the EiS are denoted counterclockwise ranging from:
        # 0 to Pi (if the rear is nearer to the wall than the front)
        # 0 to -Pi (if the front is nearer to the wall than the rear)

        # [deg]; delta error over one time step
        self.set_min_max_array_values()
        self.calculate_distance_to_goal()
        self.calculate_current_angle()
        e_d = self.control_vars["current_angle"] + 0.016
        e_d_sign = np.sign(e_d)
        e_d_sign_cur = e_d_sign

        rospy.loginfo(f"minimize_angle_deviation, e_tolerance: {e_tolerance}, e_d: {e_d}")

        rate = rospy.Rate(100)
        if abs(e_d) <= e_tolerance:
            rospy.loginfo("Target erreicht: angular reached")
            return False
        start_time = rospy.get_time()
        while (abs(e_d) > e_tolerance) and self.params["emergency_stop"] is False and e_d_sign == e_d_sign_cur:
            # Update the error and the timestep
            self.set_min_max_array_values()
            self.calculate_distance_to_goal()
            self.calculate_current_angle()
            e_d = self.control_vars["current_angle"] + 0.016
            e_d_sign_cur = np.sign(e_d)
            v = (rospy.get_time() - start_time) * 0.3
            v = np.min([v, 0.15])
            v = v * e_d_sign_cur
            self.set_velocity(0, 0, v)

            # Delay 1 millisecond:
            rate.sleep()
        # self.stop_movement(0.2, False, e_d_sign)
        self.set_velocity(0, 0, 0)
        self.set_min_max_array_values()
        self.calculate_distance_to_goal()
        self.calculate_current_angle()
        e_d = self.control_vars["current_angle"]
        rospy.loginfo(f"e_d angular end: {e_d}")

        return True

    def set_velocity(self, cmd_vel_pos_x: float, cmd_vel_pos_y: float, cmd_vel_ori_z: float):
        """Publishes the passed velocity in x- and y-direction as well as angular as a Twist message to the rostopic 'cmd_vel'

        Args:
                        cmd_vel_pos_x (float): x-velocity in m/s
                        cmd_vel_pos_y (float): y-velocity in m/s
                        cmd_vel_ori_z (float): angular velocity
        """

        # Resets all velocity commands to zero in case the robot has to stop
        # immediately:
        if self.params["emergency_stop"] is True:
            cmd_vel_pos_x = 0.
            cmd_vel_pos_y = 0.
            cmd_vel_ori_z = 0.

        vel_command = Twist()

        vel_command.linear.x = cmd_vel_pos_x
        vel_command.linear.y = cmd_vel_pos_y
        vel_command.linear.z = 0
        vel_command.angular.x = 0
        vel_command.angular.y = 0
        vel_command.angular.z = cmd_vel_ori_z
        self.publishers_subscribers["velocity_publisher"].publish(vel_command)


if __name__ == '__main__':
    rospy.init_node("fine_positioning", anonymous=False)
    positioning_robot = PositionRobot()
    rospy.spin()
