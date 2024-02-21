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

#include <ros/ros.h>
#include "fiducial_navigation/FiducialNavigation.hpp"


int main(int argc, char** argv)
{
  // Initialize ROS node
  ros::init(argc, argv, "fiducial_navigation");
  ros::NodeHandle nh;

  // Create ArucoTracker object
  fiducial_navigation::FiducialNavigation fnavigator(nh);

  // Start ROS loop
  ros::spin();

  return 0;
}