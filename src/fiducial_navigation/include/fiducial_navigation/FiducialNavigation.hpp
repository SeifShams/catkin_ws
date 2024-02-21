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

#ifndef FIDUCIAL_NAVIGATION_HPP
#define FIDUCIAL_NAVIGATION_HPP

#include <memory>
#include <vector>

#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <tf/transform_broadcaster.h>
#include <tf2_ros/transform_listener.h>
#include <geometry_msgs/TransformStamped.h>
#include <visualization_msgs/MarkerArray.h>

namespace fiducial_navigation
{

    struct VFFVectors
    {
        std::vector<float> attractive_x;
        std::vector<float> attractive_y;
        std::vector<float> attractive_z;
        std::vector<float> result;
    };

    typedef enum {RED, GREEN, BLUE, YELLOW, NUM_COLORS} VFFColor;

    class FiducialNavigation
    {
    public:
        ros::Timer timer_;
        FiducialNavigation(ros::NodeHandle nh);
        void timerCallback(const ros::TimerEvent& event);

    protected:
        visualization_msgs::MarkerArray get_debug_vff(const VFFVectors & vff_vectors);
        visualization_msgs::Marker make_marker(const std::vector<float> & vector, VFFColor vff_color);

    private:
        int ch;
        float offset_x_;
        float offset_y_;
        std::string vel_topic_;
        std::string robot_frame_;
        std::string camera_frame_;
        std::string frst_fiducial_frame_;
        std::string scnd_fiducial_frame_;

        ros::NodeHandle nh_;
        ros::Publisher vel_pub_;
        ros::Publisher vff_debug_pub_;

        tf2_ros::Buffer tfBuffer_;
        tf2_ros::TransformListener tfListener_;
        tf::TransformBroadcaster tf_broadcaster_;

        geometry_msgs::PoseStamped get_midpoint_pose();
    };

} // namespace br2_vff_avoidance

#endif