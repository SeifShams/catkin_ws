#!/usr/bin/env python3
from pathlib import Path
import rospy
from geometry_msgs.msg import PoseWithCovarianceStamped
from tf.transformations import euler_from_quaternion


class SavePosition():

    def __init__(self) -> None:
        self.last_position_x = 0.
        self.last_position_y = 0.
        self.last_position_a = 0.
        self.received_msg = False
        self.listener = rospy.Subscriber("amcl_pose", PoseWithCovarianceStamped, self.pose_callback)
        self.save_position()

    def pose_callback(self, data: PoseWithCovarianceStamped):
        # read out the published pose of the robot
        self.received_msg = True
        self.last_position_x = data.pose.pose.position.x
        self.last_position_y = data.pose.pose.position.y
        orientation_list = [data.pose.pose.orientation.x, data.pose.pose.orientation.y, data.pose.pose.orientation.z, data.pose.pose.orientation.w]
        _, _, self.last_position_a = euler_from_quaternion(orientation_list)

    def save_position(self):
        save_dir = Path(__file__).parent.parent.parent.resolve() / "tugger_train_bringup" / "config" / "navigation"
        if not Path.exists(save_dir):
            Path.mkdir(save_dir)
        while not rospy.is_shutdown():
            if self.received_msg is True:
                with open(save_dir / "initial_pose.yaml", "w", encoding="utf-8") as f:
                    f.write(f"initial_pose_x: {self.last_position_x}\n")
                    f.write(f"initial_pose_y: {self.last_position_y}\n")
                    f.write(f"initial_pose_a: {self.last_position_a}\n")
                rospy.sleep(1)
                self.received_msg = False


if __name__ == '__main__':
    rospy.init_node("store_last_position", anonymous=True)
    listener = SavePosition()
    rospy.spin()
