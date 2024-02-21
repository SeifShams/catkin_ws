from typing import Dict
from pathlib import Path
import rospy
import actionlib
from tug_navigation_tools.srv import FinePositioning, FinePositioningRequest, FinePositioningResponse
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from actionlib_msgs.msg import GoalStatus
from geometry_msgs.msg import Point, PoseWithCovarianceStamped
from tf.transformations import euler_from_quaternion, quaternion_from_euler


class Robot():

    def __init__(self):
        self.navigation_server = actionlib.SimpleActionClient("move_base", MoveBaseAction)
        while (not self.navigation_server.wait_for_server(rospy.Duration.from_sec(5.0))):
            rospy.loginfo("Waiting for the move_base action server to come up")
        rospy.wait_for_service("/tug_navigation_tools/fine_positioning")
        self.fine_positioning_server = rospy.ServiceProxy("/tug_navigation_tools/fine_positioning", FinePositioning)
        self.amcl_listener = rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, self.__save_current_position, queue_size=5)
        self.current_position = {
            "x": 0.,
            "y": 0.,
            "a": 0.
        }

    def __save_current_position(self, msg: PoseWithCovarianceStamped):
        position = msg.pose.pose.position
        orientation = msg.pose.pose.orientation
        q = [orientation.x, orientation.y, orientation.z, orientation.w]
        euler_angle = euler_from_quaternion(q)
        x = position.x
        y = position.y
        a = euler_angle[-1]
        self.current_position = {
            "x": x,
            "y": y,
            "a": a
        }

    def save_goal_position(self):
        save_dir = Path(__file__).parent.parent.resolve() / "config"
        if not Path.exists(save_dir):
            Path.mkdir(save_dir)

        with open(save_dir / "goal_position.yaml", "w", encoding="utf-8") as f:
            f.write(f"x: {self.current_position['x']}\n")
            f.write(f"y: {self.current_position['y']}\n")
            f.write(f"a: {self.current_position['a']}\n")

    def fine_position(self, initial_distance, goal_distance, wall_position) -> FinePositioningResponse:
        req = FinePositioningRequest()
        req.initial_distance = initial_distance
        req.goal_distance = goal_distance
        req.wall_position = wall_position
        return self.fine_positioning_server(req)

    def move_to_goal(self, goal: Dict):
        move_goal = MoveBaseGoal()
        move_goal.target_pose.header.frame_id = "map"
        move_goal.target_pose.header.stamp = rospy.Time.now()
        move_goal.target_pose.pose.position = Point(goal["x"], goal["y"], 0)
        q = quaternion_from_euler(0, 0, goal["a"])

        move_goal.target_pose.pose.orientation.x = q[0]
        move_goal.target_pose.pose.orientation.y = q[1]
        move_goal.target_pose.pose.orientation.z = q[2]
        move_goal.target_pose.pose.orientation.w = q[3]

        rospy.loginfo("Sending goal location ...")
        self.navigation_server.send_goal(move_goal)

        self.navigation_server.wait_for_result(rospy.Duration(60))

        if (self.navigation_server.get_state() == GoalStatus.SUCCEEDED):
            rospy.loginfo("You have reached the destination")
            return True
        rospy.loginfo("The robot failed to reach the destination")
        return False


if __name__ == '__main__':
    rospy.init_node('show_case', anonymous=False)
    show_case = Robot()
    rospy.sleep(2)
    show_case.save_goal_position()
