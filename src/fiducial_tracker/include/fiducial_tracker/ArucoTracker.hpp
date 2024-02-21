// Copyright 2023 tum fml
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

#include <vector>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2/transform_datatypes.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <tf2/convert.h>
#include <tf2_ros/buffer.h>
#include <tf2_ros/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Image.h>
#include <pcl_ros/transforms.h>
#include <fiducial_msgs/Fiducial.h>
#include <fiducial_msgs/FiducialArray.h>
#include <image_transport/image_transport.h>

#include <opencv2/aruco.hpp>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>


namespace aruco_tracker {
    
    class ArucoTracker 
    {
    public:
        ArucoTracker(ros::NodeHandle nh);

    private:
        double compute_Orientation(cv::Point2f a, cv::Point2f b, pcl::PointCloud<pcl::PointXYZ>  point_cloud_rgb, geometry_msgs::TransformStamped tf_lens_to_base);
        std::vector<cv::Point2f> getABPoints (std::vector<cv::Point2f> corners);
        void publishPointTf(int x, int y, cv::Point2f a, cv::Point2f b, int id);
        void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& msg);
        void imageCallback(const sensor_msgs::ImageConstPtr& msg);
        void updateFps();

        ros::NodeHandle nh_;
        ros::Subscriber image_sub_;
        ros::Publisher vertices_pub_;
        ros::Subscriber point_cloud_sub_;
        
        tf2_ros::Buffer tf_buffer_;
        tf2_ros::TransformBroadcaster tfb;
        tf2_ros::TransformListener tf_listener_;
        tf::TransformBroadcaster tf_broadcaster_;
        

        cv::Mat image_;
        cv_bridge::CvImagePtr cv_ptr_;
        sensor_msgs::PointCloud2 point_cloud_;

        cv::Ptr<cv::aruco::Dictionary> dictionary_;
        cv::Ptr<cv::aruco::DetectorParameters>  parameters_;

        std::string camera_frame_;
        bool compute_orientation_;
        double start_time_;
        int frame_count_;
        double fps_;

        cv::Mat camera_matrix_;
        cv::Mat dist_coeffs_;
    };
}

