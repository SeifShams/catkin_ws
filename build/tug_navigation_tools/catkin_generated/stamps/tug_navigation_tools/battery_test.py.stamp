#!/usr/bin/env python3
from typing import TypedDict
import rospy
from tug_navigation_tools.msg import EmergencyStop
from geometry_msgs.msg import Twist



class PublisherSubscribers(TypedDict):
    emergency_stop_subscriber: rospy.Subscriber
    velocity_publisher: rospy.Publisher


class CreateNavigation():

    def __init__(self) -> None:
        self.emergency_stop = False
        try:
            self.publishers_subscribers = PublisherSubscribers(
                emergency_stop_subscriber = rospy.Subscriber("/emergency_stop", EmergencyStop, self.emergency_callback),
                velocity_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10),
                )
        except rospy.ROSInterruptException:
            pass

        rospy.loginfo("Node running")
        self.publish_velocity()


    def emergency_callback(self, received_data: EmergencyStop):
        self.emergency_stop = received_data.stop_cmd
        rospy.loginfo(f"EMERGENCY STOP: Status = {received_data.stop_cmd}")
        self.publishers_subscribers["velocity_publisher"].publish(Twist())


    def publish_velocity(self):
        rate = rospy.Rate(0.3)
        counter = 3
        if self.emergency_stop is True:
            rospy.loginfo(f"WARNING emergency stop activated")
            vel_command.linear.x = 0.
            vel_command.angular.z = 0.
        while self.emergency_stop is False:
            vel_command = Twist()
            vel_command.linear.x = 0
            vel_command.linear.y = 0
            vel_command.linear.z = 0
            vel_command.angular.x = 0
            vel_command.angular.y = 0
            vel_command.angular.z = 0
            self.publishers_subscribers["velocity_publisher"].publish(vel_command)
            if counter % 4 == 0:
                vel_command.linear.x = 0.2
                self.publishers_subscribers["velocity_publisher"].publish(vel_command)
            elif counter % 4 == 1:
                vel_command.linear.x = 0
                self.publishers_subscribers["velocity_publisher"].publish(vel_command)
            elif counter % 4 == 2:
                vel_command.linear.x = -0.2
                self.publishers_subscribers["velocity_publisher"].publish(vel_command)
            elif counter % 4 == 3:
                vel_command.linear.x = 0
                self.publishers_subscribers["velocity_publisher"].publish(vel_command)
            counter = counter + 1
            rate.sleep()


if __name__ == '__main__':
    rospy.init_node("battery_test", anonymous=False)
    positioning_robot = CreateNavigation()
    rospy.spin()
