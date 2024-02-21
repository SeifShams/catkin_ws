#!/usr/bin/env python3

import tf
import cv2
import time
import rospy
import tf2_ros
import numpy as np
import cv2.aruco as aruco
from cv_bridge import CvBridge
import sensor_msgs.point_cloud2 as pc2
from fiducial_msgs.msg import Fiducial, FiducialArray
from sensor_msgs.msg import Image, CameraInfo, PointCloud2



class ArUcoDetector:
    def __init__(self):
        # Class variables
        self.image = None
        self.point_cloud = None
        self.bridge = CvBridge()

        # Initialize variables for calculating fps
        self.start_time = time.time()
        self.frame_count = 0
        self.fps = 0

        # Create a TransformBroadcaster object
        self.tf_buffer = tf2_ros.Buffer()
        self.tf_broadcaster = tf.TransformBroadcaster()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)
        
        # Create ArUco dictionary
        self.dictionary = None
        self.dictionary = aruco.Dictionary_get(aruco.DICT_6X6_250)
        self.parameters = aruco.DetectorParameters_create()

        # Subscribers
        self.point_cloud_sub = rospy.Subscriber("/points2", PointCloud2, self.point_cloud_callback)
        self.image_sub = rospy.Subscriber(rospy.get_param("~input_topic"), Image, self.image_callback)
        # Publishers
        self.vertices_pub = rospy.Publisher("fiducial_vertices", FiducialArray, queue_size=10)
        
        #Camera_info
        self.dist_coeffs = None
        self.camera_matrix = None
        
        camera_info_msg = rospy.wait_for_message("/rgb/camera_info", CameraInfo)
        self.camera_matrix = np.array(camera_info_msg.K).reshape(3, 3)
        self.dist_coeffs = np.array(camera_info_msg.D)


    def point_cloud_callback(self, msg):
        self.point_cloud = msg


    def get_orientation(self, corners, center):
        if self.camera_matrix is None or self.dist_coeffs is None:
            return None
        # Get the camera intrinsics from the camera_info message
        try:  
            
            # estimate the pose of the aruco code
            rvecs, tvecs, _ = cv2.aruco.estimatePoseSingleMarkers(corners, 0.05, self.camera_matrix, self.dist_coeffs)
            # convert the rotation vector to a rotation matrix
            rot_matrix, _ = cv2.Rodrigues(rvecs)    
            # get the rotation in z
            z_rotation = np.arctan2(rot_matrix[1,0], rot_matrix[0,0])   
            # define the length of the arrow
            length = 25 
            # convert the angle to radians
            angle_radians = z_rotation  
            # calculate the endpoint of the arrow
            pt2 = (int(center[0] + length * np.cos(angle_radians)), int(center[1] + length * np.sin(angle_radians)))    
            # draw the arrow on the image
            cv2.arrowedLine(self.image, center, pt2, (0, 0, 255), thickness=2)
        except rospy.exceptions.ROSException:
            rospy.logerr("No camera info message received")
            return  

    
    def publish_point_tf(self, x, y, id):

        if self.point_cloud is None:
            return

        point_generator= pc2.read_points(self.point_cloud, skip_nans=False, field_names=("x", "y", "z"))
        self.pc = np.array(list(point_generator))

        # Extract the corresponding 3D point from the point cloud
        row, col, _ = self.image.shape
        
        point = self.pc[(col * y) + x]
        transform = ((point[0], point[1], point[2]), tf.transformations.quaternion_from_euler(0, 0, 0))

        # Publish the transform
        self.tf_broadcaster.sendTransform(transform[0], transform[1], rospy.Time.now(), 
                                          "ArUco" + str(id[0]), self.point_cloud.header.frame_id)



    def update_fps(self):
        self.frame_count += 1
        elapsed_time = time.time() - self.start_time
        if elapsed_time > 1:
            self.fps = self.frame_count / elapsed_time
            self.frame_count = 0
            self.start_time = time.time()


    def image_callback(self, data):
        self.image = self.bridge.imgmsg_to_cv2(data, desired_encoding='bgr8')

        gray = cv2.cvtColor(self.image, cv2.COLOR_BGR2GRAY)

        corners, ids, rejectedImgPoints = aruco.detectMarkers(gray, self.dictionary, parameters=self.parameters)
        cv2.aruco.drawDetectedMarkers(gray, corners, ids)

        fva = FiducialArray() 
        fva.header = data.header

        if ids is not None:
            aruco.drawDetectedMarkers(self.image, corners, ids)
            for i, id in enumerate(ids):

                center = tuple(np.mean(corners[i][0], axis=0).astype(int))
                cv2.circle(self.image, center, 5, (0, 0, 255), -1)

                fid = Fiducial()
                fid.fiducial_id = id[0]

                fid.x0 = corners[i][0][0][0]
                fid.y0 = corners[i][0][0][1]
                fid.x1 = corners[i][0][1][0]
                fid.y1 = corners[i][0][1][1]
                fid.x2 = corners[i][0][2][0]
                fid.y2 = corners[i][0][2][1]
                fid.x3 = corners[i][0][3][0]
                fid.y3 = corners[i][0][3][1]

                fva.fiducials.append(fid)
                self.get_orientation(corners[i], center)
                self.publish_point_tf(center[0], center[1], id)

        self.vertices_pub.publish(fva)
        self.update_fps()
        
        # Draw the fps on the image
        cv2.putText(self.image, "FPS: {:.2f}".format(self.fps), (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
        cv2.imshow("Image", self.image)
        cv2.waitKey(3)


if __name__ == '__main__':
    rospy.init_node('ar_detect', anonymous=True)

    try:
        detector = ArUcoDetector()
        rospy.spin()
    except rospy.ROSInterruptException:
        cv2.destroyAllWindows()