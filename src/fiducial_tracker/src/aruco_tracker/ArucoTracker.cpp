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

#include <chrono>
#include <iostream>
#include <pcl_ros/transforms.h>
#include <sensor_msgs/CameraInfo.h>
#include "fiducial_tracker/ArucoTracker.hpp"
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/point_cloud_conversion.h>

using namespace std;
using namespace cv;

namespace aruco_tracker{
    
    ArucoTracker::ArucoTracker(ros::NodeHandle nh_) :
    tf_listener_(tf_buffer_)
    {
        // Initialize subscribers and publishers
        point_cloud_sub_ = nh_.subscribe("/points2", 1, &ArucoTracker::pointCloudCallback, this);
        vertices_pub_ = nh_.advertise<fiducial_msgs::FiducialArray>("fiducial_vertices", 10);
        image_sub_ = nh_.subscribe("/rgb/image_raw", 1, &ArucoTracker::imageCallback, this);
        
        nh_.param<bool>("/aruco_tracker_node/compute_orientation", compute_orientation_, "false");
        nh_.param<std::string>("/aruco_tracker_node/camera_frame", camera_frame_, "camera_base");
        dictionary_= cv::aruco::getPredefinedDictionary(cv::aruco::DICT_6X6_250);
        parameters_ = cv::aruco::DetectorParameters::create();

        start_time_ = ros::Time::now().toSec();
        frame_count_ = 0;
        fps_ = 0.0;

        std::cout<<"ArUco tracked started with camera frame: "<< camera_frame_<<std::endl;

        // Get camera_info
        sensor_msgs::CameraInfo::ConstPtr camera_info_msg = ros::topic::waitForMessage<sensor_msgs::CameraInfo>("/rgb/camera_info", nh_);
    }

    void ArucoTracker::pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& msg)
    {
        point_cloud_ = *msg;
    };

    void ArucoTracker::imageCallback(const sensor_msgs::ImageConstPtr& msg)
    {
       
        try {
            cv_ptr_ = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        } 
        catch (cv_bridge::Exception& e) {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }
        cv::Mat gray;
        cv::cvtColor(cv_ptr_->image, gray, cv::COLOR_BGR2GRAY);

        std::vector<std::vector<cv::Point2f>> corners;
        std::vector<int> ids;
        aruco::detectMarkers(gray, dictionary_, corners, ids, parameters_);
        aruco::drawDetectedMarkers(cv_ptr_->image, corners, ids);

        fiducial_msgs::FiducialArray fva;
        fva.header = msg->header;

        if (!ids.empty()) {
            aruco::drawDetectedMarkers(cv_ptr_->image, corners, ids);
            for (size_t i = 0; i < ids.size(); i++) {
                cv::Point2f center(cv::mean(corners[i])[0], cv::mean(corners[i])[1]);

                cv::circle(cv_ptr_->image, center, 5, cv::Scalar(0, 0, 255), -1);

                fiducial_msgs::Fiducial fid;
                fid.fiducial_id = ids[i];

                fid.x0 = corners[i][0].x;
                fid.y0 = corners[i][0].y;
                fid.x1 = corners[i][1].x;
                fid.y1 = corners[i][1].y;
                fid.x2 = corners[i][2].x;
                fid.y2 = corners[i][2].y;
                fid.x3 = corners[i][3].x;
                fid.y3 = corners[i][3].y;

                fva.fiducials.push_back(fid);

                std::vector<cv::Point2f> ab_points = getABPoints(corners[i]);
                cv::putText(cv_ptr_->image, "a", ab_points[0], cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(255, 0, 0), 1);
                cv::putText(cv_ptr_->image, "b", ab_points[1], cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(255, 0, 0), 1);

                publishPointTf(center.x, center.y, ab_points[0], ab_points[1], ids[i]);
            }
        }

        vertices_pub_.publish(fva);
        updateFps();

        // Draw the fps on the image
        cv::putText(cv_ptr_->image, cv::format("FPS: %.2f", fps_), cv::Point(10, 30), cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 255, 0), 2);
        cv::imshow("Image", cv_ptr_->image);
        cv::waitKey(3);

    };

    std::vector<cv::Point2f> ArucoTracker::getABPoints (std::vector<cv::Point2f> corners){
        // Initialize the two smallest X points with the first two points in the vector
        cv::Point2f largest_y1 = corners[0];
        cv::Point2f largest_y2 = corners[1];

        // Iterate through the remaining points in the vector
        for (size_t i = 2; i < corners.size(); ++i) {
            if (corners[i].y > largest_y1.y) {
                if(largest_y1.y > largest_y2.y)
                    largest_y2 = largest_y1;
                largest_y1 = corners[i];
            } else if (corners[i].y > largest_y2.y) {
                largest_y2 = corners[i];
            }
        }

        cv::Point2f a = largest_y1.x < largest_y2.x?largest_y1:largest_y2;
        cv::Point2f b = largest_y1.x > largest_y2.x?largest_y1:largest_y2; 

        std::vector<cv::Point2f> a_b_points = {a,b};
        return a_b_points;
    }
    
    void ArucoTracker::publishPointTf(int center_x, int center_y, cv::Point2f a, cv::Point2f b, int id)
    {
        if (point_cloud_.data.empty())
        {
            return;
        }
        
        pcl::PointCloud<pcl::PointXYZ>  point_cloud_rgb;
        pcl::fromROSMsg(point_cloud_, point_cloud_rgb);
        
        int pcl_index = (center_y * cv_ptr_->image.cols) + center_x;
        pcl::PointXYZ center_point =  point_cloud_rgb.at(pcl_index);
        double yaw = 0;

        geometry_msgs::TransformStamped tf_lens_to_base;
        try{
            tf_lens_to_base = tf_buffer_.lookupTransform(camera_frame_, 
                point_cloud_rgb.header.frame_id,
                ros::Time(0));
        }
        catch (tf2::TransformException &ex) {
            ROS_WARN("%s",ex.what());
            ros::Duration(1.0).sleep();
        }

        if(compute_orientation_){
            yaw = compute_Orientation(a, b, point_cloud_rgb, tf_lens_to_base);
        }

        geometry_msgs::TransformStamped object_tf_lens;
        object_tf_lens.header.stamp = ros::Time::now();
        object_tf_lens.header.frame_id = point_cloud_rgb.header.frame_id;
        object_tf_lens.child_frame_id = "ArUco" + std::to_string(id);
        object_tf_lens.transform.translation.x = center_point.x;
        object_tf_lens.transform.translation.y = center_point.y;
        object_tf_lens.transform.translation.z = center_point.z;
        
        object_tf_lens.transform.rotation.x = 0;
        object_tf_lens.transform.rotation.y = 0;
        object_tf_lens.transform.rotation.z = 0;
        object_tf_lens.transform.rotation.w = 1;

        // Perform the transformation to camera_base_frame
        geometry_msgs::TransformStamped object_tf_base;
        tf2::doTransform(object_tf_lens, object_tf_base, tf_lens_to_base);

        ros::Rate rate(10.0);
        object_tf_base.header.stamp = ros::Time::now();
        object_tf_base.child_frame_id = object_tf_lens.child_frame_id;
        
        tf2::Quaternion q;
        q.setRPY(0, 0, yaw);
        object_tf_base.transform.rotation.x = q.x();
        object_tf_base.transform.rotation.y = q.y();
        object_tf_base.transform.rotation.z = q.z();
        object_tf_base.transform.rotation.w = q.w();
        
        tfb.sendTransform(object_tf_base);
        rate.sleep();

    };

    double ArucoTracker::compute_Orientation(cv::Point2f a, cv::Point2f b, pcl::PointCloud<pcl::PointXYZ>  point_cloud_rgb, geometry_msgs::TransformStamped tf_lens_to_base){
        int pa_index = (a.y * cv_ptr_->image.cols) + a.x;
        int pb_index = (b.y * cv_ptr_->image.cols) + b.x;

        pcl::PointXYZ a_point =  point_cloud_rgb.at(pa_index);
        pcl::PointXYZ b_point =  point_cloud_rgb.at(pb_index);
        geometry_msgs::TransformStamped a_tf_lens;
        
        a_tf_lens.header.stamp = ros::Time::now();
        a_tf_lens.header.frame_id = point_cloud_rgb.header.frame_id;
        a_tf_lens.child_frame_id = "A_";
        a_tf_lens.transform.translation.x = a_point.x;
        a_tf_lens.transform.translation.y = a_point.y;
        a_tf_lens.transform.translation.z = a_point.z;
        a_tf_lens.transform.rotation.x = 0;
        a_tf_lens.transform.rotation.y = 0;
        a_tf_lens.transform.rotation.z = 0;
        a_tf_lens.transform.rotation.w = 1;

        geometry_msgs::TransformStamped b_tf_lens;
        b_tf_lens.header.stamp = ros::Time::now();
        b_tf_lens.header.frame_id = point_cloud_rgb.header.frame_id;
        b_tf_lens.child_frame_id = "B_";
        b_tf_lens.transform.translation.x = b_point.x;
        b_tf_lens.transform.translation.y = b_point.y;
        b_tf_lens.transform.translation.z = b_point.z;
        b_tf_lens.transform.rotation.x = 0;
        b_tf_lens.transform.rotation.y = 0;
        b_tf_lens.transform.rotation.z = 0;
        b_tf_lens.transform.rotation.w = 1;

        geometry_msgs::TransformStamped a_tf_base;
        geometry_msgs::TransformStamped b_tf_base;

        tf2::doTransform(a_tf_lens, a_tf_base, tf_lens_to_base);
        tf2::doTransform(b_tf_lens, b_tf_base, tf_lens_to_base);

        // Compute the direction vector between the two points
        double dx = a_tf_base.transform.translation.x - b_tf_base.transform.translation.x;
        double dy = a_tf_base.transform.translation.y - b_tf_base.transform.translation.y;
        return std::atan2(dy, dx);
    }

    void ArucoTracker::updateFps()
    {
        frame_count_++;
        double elapsed_time = ros::Time::now().toSec() - start_time_;
        if (elapsed_time > 1) {
            fps_ = frame_count_ / elapsed_time;
            frame_count_ = 0;
            start_time_ = ros::Time::now().toSec();
        }
    };

}


