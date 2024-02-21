// Copyright 2023 TUM FML
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/* Author: Daniel Vidal daniel.vidal@tum.de */


#include <utility>
#include <algorithm>

#include <geometry_msgs/Twist.h>
#include "fiducial_navigation/FiducialNavigation.hpp"


using std::placeholders::_1;
using namespace std::chrono_literals;

namespace fiducial_navigation
{

    FiducialNavigation::FiducialNavigation(ros::NodeHandle nh_)
    : tfListener_(tfBuffer_)
    {
      // Read parameter values from the ROS parameter server
      std::string offset_x;
      std::string offset_y;
      nh_.param<std::string>("/fiducial_navigation_node/offset_x", offset_x, "camera_base");
      nh_.param<std::string>("/fiducial_navigation_node/offset_y", offset_y, "camera_base");
      nh_.param<std::string>("/fiducial_navigation_node/vel_topic", vel_topic_, "vel_topic");
      nh_.param<std::string>("/fiducial_navigation_node/robot_frame", robot_frame_, "robot_frame");
      nh_.param<std::string>("/fiducial_navigation_node/camera_frame", camera_frame_, "camera_base");
      nh_.param<std::string>("/fiducial_navigation_node/first_fiducial_frame", frst_fiducial_frame_, "ArUco1");
      nh_.param<std::string>("/fiducial_navigation_node/second_fiducial_frame", scnd_fiducial_frame_, "ArUco2");

      ch = 0;
      offset_x_ = std::stof(offset_x);
      offset_y_ = std::stof(offset_y);

      timer_ = nh_.createTimer(ros::Duration(0.1), &FiducialNavigation::timerCallback, this);
      vel_pub_ = nh_.advertise<geometry_msgs::Twist>(vel_topic_, 1);
      vff_debug_pub_ = nh_.advertise<visualization_msgs::MarkerArray>("vff_debug", 100);
    }

    geometry_msgs::PoseStamped
    FiducialNavigation::get_midpoint_pose()
    {  
      // Get the transform from first fiducial frame to robot base
      geometry_msgs::TransformStamped first_fiducial_pose;
      try {
          first_fiducial_pose = tfBuffer_.lookupTransform(robot_frame_, frst_fiducial_frame_, ros::Time(0));
          } catch (tf::TransformException& ex) {
              ROS_WARN("%s", ex.what());
              return geometry_msgs::PoseStamped();
          }

      // Get the transform from second fiducial frame to robot base
      geometry_msgs::TransformStamped second_fiducial_pose;
      try {
          second_fiducial_pose = tfBuffer_.lookupTransform(robot_frame_, scnd_fiducial_frame_, ros::Time(0));
          } catch (tf::TransformException& ex) {
              ROS_WARN("%s", ex.what());
              return geometry_msgs::PoseStamped();
          }
      
      // If the transform value is older than one second ignore it
      if(((ros::Time::now() - first_fiducial_pose.header.stamp).toSec() > 1.0) or 
          ((ros::Time::now() - second_fiducial_pose.header.stamp).toSec() > 1.0))
          {
            return geometry_msgs::PoseStamped();
          }

      //Get leftmost fiducial
      if (second_fiducial_pose.transform.translation.y < first_fiducial_pose.transform.translation.y)
      {
        geometry_msgs::TransformStamped auxiliar = second_fiducial_pose;
        second_fiducial_pose = first_fiducial_pose;
        first_fiducial_pose = auxiliar;
      }

      // Compute the middle point
      geometry_msgs::Vector3 middlePoint;
      middlePoint.x = (first_fiducial_pose.transform.translation.x + second_fiducial_pose.transform.translation.x) / 2.0;
      middlePoint.y = (first_fiducial_pose.transform.translation.y + second_fiducial_pose.transform.translation.y) / 2.0;
      middlePoint.z = (first_fiducial_pose.transform.translation.z + second_fiducial_pose.transform.translation.z) / 2.0;

      // Compute the direction vector between the two points
      double dx = second_fiducial_pose.transform.translation.x - first_fiducial_pose.transform.translation.x;
      double dy = second_fiducial_pose.transform.translation.y - first_fiducial_pose.transform.translation.y;
      double angle = std::atan2(dy, dx);

      //std::cout << "\nmid point " << std::endl;
      //std::cout << "a point:\n" << first_fiducial_pose.transform.translation << std::endl; 
      //std::cout << "b point:\n" << second_fiducial_pose.transform.translation << std::endl;
      //std::cout << "dx: " << dx << std::endl;
      //std::cout << "dy: " << dy << std::endl;
      //std::cout << "yaw " << angle << std::endl;

      // Convert the angle to degrees
      double degrees = angle * 180.0 / M_PI;

      tf::Transform transform;
      transform.setOrigin( tf::Vector3(middlePoint.x, middlePoint.y, middlePoint.z));
      tf::Quaternion q;
      
      q.setRPY(0, 0, angle);
      transform.setRotation(q);
      tf::StampedTransform transformStamped = tf::StampedTransform(transform, ros::Time::now(), robot_frame_, "mid_point"); 
      tf_broadcaster_.sendTransform(transformStamped);

      // Get the transform from mid_point frame to camera frame
      geometry_msgs::TransformStamped mid_point_tfm;
      try {
          mid_point_tfm = tfBuffer_.lookupTransform(camera_frame_, "mid_point", ros::Time(0));
          } catch (tf::TransformException& ex) {
              ROS_WARN("%s", ex.what());
              return geometry_msgs::PoseStamped();
          }

      // Create a PoseStamped message
      geometry_msgs::PoseStamped mid_point_pose;

      // Populate the header of the PoseStamped message
      mid_point_pose.header.frame_id = "mid_point";  // Set the frame ID
      mid_point_pose.header.stamp = ros::Time::now();  // Set the timestamp

      // Populate the pose in the PoseStamped message
      mid_point_pose.pose.position.x = mid_point_tfm.transform.translation.x; 
      mid_point_pose.pose.position.y = mid_point_tfm.transform.translation.y; 
      mid_point_pose.pose.position.z = mid_point_tfm.transform.translation.z; 

      mid_point_pose.pose.orientation.x = 0; 
      mid_point_pose.pose.orientation.y = 0; 
      mid_point_pose.pose.orientation.z = degrees; 
      mid_point_pose.pose.orientation.w = 1.0;  // Set the w-component of the quaternion

      return mid_point_pose;
    }
    
    void
    FiducialNavigation::timerCallback(const ros::TimerEvent& event)
    {
      // Get VFF vectors
      geometry_msgs::Twist vel;
      geometry_msgs::PoseStamped mid_point_pose = get_midpoint_pose();
      if (mid_point_pose.header.frame_id != "mid_point"){
        vel_pub_.publish(vel);
        return;
      }

      // Use result vector to calculate output speed
      double angle = mid_point_pose.pose.orientation.z;
      double rad_angle = (angle - 90) * M_PI / 180;

      double x_vel = mid_point_pose.pose.position.x;
      double y_vel = mid_point_pose.pose.position.y;
      double z_vel = mid_point_pose.pose.position.z;

      // Init vectors
      VFFVectors vff_vector;
      vff_vector.attractive_x = {x_vel, 0.0, 0.0};  // Robot wants to go forward
      vff_vector.attractive_y = {0.0, y_vel, 0.0};
      vff_vector.attractive_z = {0.0, 0.0, z_vel};
      vff_vector.result = {x_vel, y_vel, z_vel};


      // Create ouput message, controlling speed limits
      vel.linear.x = std::clamp(x_vel - offset_x_, -0.2, 0.2);  // truncate linear vel to [0.0, 0.5] m/s
      vel.linear.y = -std::clamp(y_vel - offset_y_, -0.2, 0.2);  // truncate linear vel to [0.0, 0.5] m/s
      vel.angular.z = std::clamp(rad_angle, -0.1, 0.1);  // truncate rotation vel to [-0.5, 0.5] rad/s

      // Produce debug information, if any interested
      if (vff_debug_pub_.getNumSubscribers() > 0) {
        vff_debug_pub_.publish(get_debug_vff(vff_vector));
      }


      //ROS_INFO("angle: %f, radians corrected: %f, angular speed: %f", angle, rad_angle, vel.angular.z);
      //if (ch == 0){
      //  ROS_INFO("Velocity command ready, press a key to continue");
      //  ch = getchar();
      //}
      

      vel_pub_.publish(vel);
    }

    visualization_msgs::MarkerArray
    FiducialNavigation::get_debug_vff(const VFFVectors & vff_vectors)
    {
      visualization_msgs::MarkerArray marker_array;

      marker_array.markers.push_back(make_marker(vff_vectors.attractive_x, RED));
      marker_array.markers.push_back(make_marker(vff_vectors.attractive_y, GREEN));
      marker_array.markers.push_back(make_marker(vff_vectors.attractive_z, BLUE));
      marker_array.markers.push_back(make_marker(vff_vectors.result, YELLOW));

      return marker_array;
    }

    visualization_msgs::Marker
    FiducialNavigation::make_marker(const std::vector<float> & vector, VFFColor vff_color)
    {
      visualization_msgs::Marker marker;

      marker.header.frame_id = camera_frame_;
      marker.header.stamp = ros::Time::now();
      marker.type = visualization_msgs::Marker::ARROW;
      marker.id = visualization_msgs::Marker::ADD;

      geometry_msgs::Point start;
      start.x = 0.0;
      start.y = 0.0;
      start.z = 0.0;
      geometry_msgs::Point end;
      end.x = vector[0];
      end.y = vector[1];
      end.z = vector[2];
      marker.points = {start, end};
      marker.pose.orientation.w = 1;

      marker.scale.x = 0.02;
      marker.scale.y = 0.03;

      switch (vff_color) {
        case RED:
          marker.id = 0;
          marker.color.r = 1.0;
          break;
        case GREEN:
          marker.id = 1;
          marker.color.g = 1.0;
          break;
        case BLUE:
          marker.id = 2;
          marker.color.b = 1.0;
          break;
        case YELLOW:
          marker.id = 3;
          marker.color.r = 1.0;
          marker.color.g = 1.0;
          break;
      }
      marker.color.a = 1.0;

      return marker;
    }

}  // namespace fiducial_navigation