#include <iostream>
#include <ros/ros.h>
#include <tf2/LinearMath/Transform.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Vector3Stamped.h>
#include <geometry_msgs/PointStamped.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "transform_example");
    ros::NodeHandle nh;

    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformBroadcaster tfb;
    tf2_ros::TransformListener tfListener(tfBuffer);
    
    std::string reference_frame = "depth_front_camera_base";
    std::string object2_frame = "bod_2";
    std::string object3_frame = "bod_3";
    
    while (nh.ok()){
        geometry_msgs::TransformStamped transformStamped_r2;
        geometry_msgs::TransformStamped transformStamped_r3;
        try{
            transformStamped_r2 = tfBuffer.lookupTransform(object2_frame, reference_frame, ros::Time(0));
            transformStamped_r3 = tfBuffer.lookupTransform(object3_frame, reference_frame, ros::Time(0));  
            tfb.sendTransform(transformStamped_r2);
            tfb.sendTransform(transformStamped_r3);

        } catch (tf2::TransformException &ex) {
            ROS_ERROR("Error: %s", ex.what());
            ros::Duration(1.0).sleep();
            continue;
        }
    }
    return 0;
}