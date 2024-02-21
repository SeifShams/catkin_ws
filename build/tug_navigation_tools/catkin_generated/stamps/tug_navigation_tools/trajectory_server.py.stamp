#!/usr/bin/env python3
from typing import TypedDict
import rospy
from tug_navigation_tools.srv import trajectory, calculate_rotation
from tug_navigation_tools.msg import EmergencyStop, AccelerationStamped
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import Twist
import numpy as np
from scipy.interpolate import CubicSpline
from nav_msgs.msg import Path
from scipy.integrate import quad


class PublisherSubscribers(TypedDict):
    emergency_stop_subscriber: rospy.Subscriber
    velocity_publisher: rospy.Publisher
    acceleration_punlisher: rospy.Publisher
    path_publisher: rospy.Publisher


class CreateNavigation():

    def __init__(self) -> None:
        self.emergency_stop = False
        self.plannedpath_x = []
        self.plannedpath_y = []
        self.milestones = 100
        try:
            self.publishers_subscribers = PublisherSubscribers(
                emergency_stop_subscriber = rospy.Subscriber("/emergency_stop", EmergencyStop, self.emergency_callback),
                velocity_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10),
                path_publisher = rospy.Publisher("/smooth_path", Path, queue_size=1),
                acceleration_punlisher = rospy.Publisher("/acc_yaw", AccelerationStamped, queue_size=10)
                )
        except rospy.ROSInterruptException:
            pass

        rospy.Service("/tug_navigation_tools/trajectory_server", trajectory, self.handle_trajetory_req)
        rospy.Service("/calculate_initial_rotation", calculate_rotation, self.handle_calculate_rotation)
        rospy.loginfo("Server running")

    
    def handle_trajetory_req(self, req: trajectory):
        self.get_move_base_path(req.path)
        V, Omega, _, Omega_prime = self.transform_path_to_trajectory()
        # thread1 = Thread(target=self.publish_velocity, args=(V, Omega))
        # thread2 = Thread(target=self.publish_acc, args=(Omega_prime,))
        # thread1.start()
        # thread2.start()
        self.publish_velocity(V, Omega)
        return True


    def emergency_callback(self, received_data: EmergencyStop):
        self.emergency_stop = received_data.stop_cmd
        rospy.loginfo(f"EMERGENCY STOP: Status = {received_data.stop_cmd}")
        self.publishers_subscribers["velocity_publisher"].publish(Twist())


    def get_move_base_path(self, req:Path):
        self.plannedpath_x.clear()
        self.plannedpath_y.clear()
        counter = 0
        #take every 80 milestone
        for pose in req.poses:
            if counter % self.milestones == 0 or counter == len(req.poses)-1:
                self.plannedpath_x.append(float(pose.pose.position.x))
                self.plannedpath_y.append(float(pose.pose.position.y))
            counter = counter + 1


    def transform_path_to_trajectory(self):
        # Set the total running time
        T = len(self.plannedpath_x)*self.milestones*0.1
        # Create the array of t values
        n_points = len(self.plannedpath_x)
        t_n = np.linspace(0, T, n_points)
        # Create the CubicSpline interpolation
        Curve = CubicSpline(t_n, np.c_[self.plannedpath_x, self.plannedpath_y], axis=0)
        t_dense = np.linspace(0, T, 1000)
        self.publish_path(Curve(t_dense)[:, 0], Curve(t_dense)[:, 1])
        # Compute the derivative of the interpolation function
        Curve_der = Curve.derivative()
        # Velocity function
        v = lambda t: Curve_der(t)
        # Define the velocity functions vx and vy
        vx = lambda t: v(t)[0]
        vy = lambda t: v(t)[1]
        # Define the heading angle theta as a function of time
        theta = lambda t: np.arctan2(vy(t), vx(t))
        # Define a small time interval, e.g., delta_t = 1e-10
        delta_t = 1e-10
        # Define the angular velocity omega as the derivative of theta
        Omega = lambda t: (theta(t + delta_t) - theta(t)) / delta_t
        def integrand(t):
            dx_dt, dy_dt = Curve_der(t)
            return np.sqrt(dx_dt**2 + dy_dt**2)
        # Calculate the total path length using numerical integration
        total_path_length, _ = quad(integrand, 0, T)
        # speed in x direction
        V = total_path_length/T
        # acceleration of omega
        def centered_derivative(f, t):
            return (f(t + delta_t/2) - f(t - delta_t/2)) / delta_t
        # Omega_prime = lambda t: centered_derivative(Omega, t)
        Omega_prime = lambda t_list: list(map(centered_derivative, [Omega]*len(t_list), t_list))

        return V, Omega, theta(0), Omega_prime


    def handle_calculate_rotation(self, req: calculate_rotation):
        self.get_move_base_path(req.path)
        _, _, theta_0, _ = self.transform_path_to_trajectory()
        return theta_0


    def publish_velocity(self, V, Omega):
        rate = rospy.Rate(100)
        start_time = rospy.Time.now()
        elapsed_time_s = 0
        while elapsed_time_s < len(self.plannedpath_x)*self.milestones*0.1-0.2 and self.emergency_stop is False:
            current_time = rospy.Time.now()
            elapsed_time = current_time - start_time
            elapsed_time_s = elapsed_time.to_sec()
            if (Omega(elapsed_time_s) > -5) and (Omega(elapsed_time_s) < 5):
                if (V >= 0) and (V < 5):
                    if self.emergency_stop is True:
                        rospy.loginfo(f"WARNING emergency stop activated")
                        vel_command.linear.x = 0.
                        vel_command.angular.z = 0.
                    vel_command = Twist()
                    vel_command.linear.x = V
                    vel_command.linear.y = 0
                    vel_command.linear.z = 0
                    vel_command.angular.x = 0
                    vel_command.angular.y = 0
                    vel_command.angular.z = Omega(elapsed_time_s)
                    self.publishers_subscribers["velocity_publisher"].publish(vel_command)
                else:
                    rospy.logerr(f"vel_linear_x is out of bounds (0.0 - 1.0): {V}")
            else:
                rospy.logerr(f"vel_angular_z is out of bounds (-1.0 - 1.0): {Omega(elapsed_time_s)}")
            rate.sleep()
        vel_command = Twist()
        vel_command.linear.x = 0.
        vel_command.linear.y = 0.
        vel_command.linear.z = 0.
        vel_command.angular.x = 0.
        vel_command.angular.y = 0.
        vel_command.angular.z = 0.
        self.publishers_subscribers["velocity_publisher"].publish(vel_command)


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

    
    def publish_acc(self, Omega_prime):
        rate = rospy.Rate(1)
        start_time = rospy.Time.now()
        elapsed_time_s = 0
        while elapsed_time_s < len(self.plannedpath_x)*self.milestones*0.1-3:
            current_time = rospy.Time.now()
            elapsed_time = current_time - start_time
            elapsed_time_s = elapsed_time.to_sec()
            end_time = elapsed_time_s + 3  # Three seconds later
            time_values = np.arange(elapsed_time_s, end_time, 0.1)  # Generate timestamps
            accel_values = Omega_prime(time_values)  # Compute acceleration values
            time_stamps = [rospy.Time.from_sec(t) for t in time_values]
            msg = AccelerationStamped()
            msg.header.stamp = rospy.Time.now() 
            msg.accelerations = accel_values
            msg.time_stamps = time_stamps
            self.publishers_subscribers["acceleration_punlisher"].publish(msg)
            rate.sleep()


if __name__ == '__main__':
    rospy.init_node("trajectory_server", anonymous=False)
    positioning_robot = CreateNavigation()
    rospy.spin()
