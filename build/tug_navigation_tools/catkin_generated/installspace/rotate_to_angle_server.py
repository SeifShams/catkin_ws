import rospy
import numpy as np
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from tf.transformations import euler_from_quaternion
from tug_navigation_tools.srv import rotate_to_angle
from tug_navigation_tools.msg import EmergencyStop
from geometry_msgs.msg import PoseWithCovarianceStamped
from typing import TypedDict


class PublisherSubscribers(TypedDict):
    emergency_stop_subscriber: rospy.Subscriber
    odom_subscriber: rospy.Subscriber
    velocity_publisher: rospy.Publisher

class RotateToAngle():

    def __init__(self) -> None:
        self.emergency_stop = False
        self.phi_map = 0

        try:
            self.publishers_subscribers = PublisherSubscribers(
                odom_subscriber=rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, self.pose_callback),
                emergency_stop_subscriber=rospy.Subscriber("/emergency_stop", EmergencyStop, self.emergency_callback),
                velocity_publisher=rospy.Publisher("/cmd_vel", Twist, queue_size=10)
            )
        except rospy.ROSInterruptException:
            pass

        rospy.Service("/rotate_to_angle_service", rotate_to_angle, self.handle_rotate_angle)
        rospy.loginfo("Server running")


    def pose_callback(self, data: Odometry):
        _, _, self.phi_map = euler_from_quaternion([data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w])
    

    def emergency_callback(self, received_data: EmergencyStop):
        self.emergency_stop = received_data.stop_cmd
        rospy.loginfo(f"EMERGENCY STOP: Status = {received_data.stop_cmd}")
        self.publishers_subscribers["velocity_publisher"].publish(Twist())


    def set_velocity(self, cmd_vel_pos_x: float, cmd_vel_pos_y: float, cmd_vel_ori_z: float):
        """Publishes the passed velocity in x- and y-direction as well as angular as a Twist message to the rostopic 'cmd_vel'

        Args:
                        cmd_vel_pos_x (float): x-velocity in m/s
                        cmd_vel_pos_y (float): y-velocity in m/s
                        cmd_vel_ori_z (float): angular velocity
        """
        # Check the given velocities whether they are reasonable:
        if (cmd_vel_ori_z>-5) and (cmd_vel_ori_z<5):
            if (cmd_vel_pos_x>=0) and (cmd_vel_pos_x<5):
                if (cmd_vel_pos_y>=0) and (cmd_vel_pos_y<5):

                    # rospy.loginfo(f"New velocity set: x:{cmd_vel_pos_x}, y:{cmd_vel_pos_y}, phi:{cmd_vel_ori_z}")
                    # Resets all velocity commands to zero in case the robot has to stop
                    # immediately:
                    if self.emergency_stop is True:
                        rospy.loginfo(f"WARNING emergency stop activated")
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
                else:
                    rospy.logerr(f"cmd_vel_pos_y is out of bounds (0.0 - 1.0): {cmd_vel_pos_y}")
            else:
                rospy.logerr(f"cmd_vel_pos_x is out of bounds (0.0 - 1.0): {cmd_vel_pos_x}")
        else:
            rospy.logerr(f"cmd_vel_ori_z is out of bounds (-1.0 - 1.0): {cmd_vel_ori_z}")


    def handle_rotate_angle(self, req:rotate_to_angle):
        # get angle deviation
        #rospy.loginfo(f"STATUS: Angular alignment started. Desired angle: {desired_angle}")
        angle_deviation = self.phi_map - req.desired_phi
        if angle_deviation > np.pi:
            angle_deviation = angle_deviation - 2*np.pi
        angle_tolerance = 0.01
        # rotate to the correct angle
        rate2 = rospy.Rate(100)
        while np.absolute(angle_deviation)>angle_tolerance and self.emergency_stop is False:
            # Update the desired velocity:
            self.set_velocity(0, 0, -0.2*np.sign(angle_deviation))
            angle_deviation = self.phi_map - req.desired_phi
            # Delay 1 millisecond:
            rate2.sleep()
        # stop the rotation and publish that the angle has been reached:
        self.set_velocity(0, 0, 0)
        #rospy.loginfo(f"STATUS: Angular alignment finished. Angle has been reached: {self.recentodomstate['phi_map']}. Remaining deviation: {angle_deviation}")
        return True


if __name__ == '__main__':
    rospy.init_node("rotate_to_angle", anonymous=False)
    positioning_robot = RotateToAngle()
    rospy.spin()
