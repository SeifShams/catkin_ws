;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::calculate_rotation)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'calculate_rotation (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::CALCULATE_ROTATION")
  (make-package "TUG_NAVIGATION_TOOLS::CALCULATE_ROTATION"))
(unless (find-package "TUG_NAVIGATION_TOOLS::CALCULATE_ROTATIONREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::CALCULATE_ROTATIONREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::CALCULATE_ROTATIONRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::CALCULATE_ROTATIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))




(defclass tug_navigation_tools::calculate_rotationRequest
  :super ros::object
  :slots (_path ))

(defmethod tug_navigation_tools::calculate_rotationRequest
  (:init
   (&key
    ((:path __path) (instance nav_msgs::Path :init))
    )
   (send-super :init)
   (setq _path __path)
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/Path _path
    (send _path :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/Path _path
       (send _path :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/Path _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;;
   self)
  )

(defclass tug_navigation_tools::calculate_rotationResponse
  :super ros::object
  :slots (_angle ))

(defmethod tug_navigation_tools::calculate_rotationResponse
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float64 _angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tug_navigation_tools::calculate_rotation
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::calculate_rotation :md5sum-) "d61b10bf9711ffd345b1e65c96b513fa")
(setf (get tug_navigation_tools::calculate_rotation :datatype-) "tug_navigation_tools/calculate_rotation")
(setf (get tug_navigation_tools::calculate_rotation :request) tug_navigation_tools::calculate_rotationRequest)
(setf (get tug_navigation_tools::calculate_rotation :response) tug_navigation_tools::calculate_rotationResponse)

(defmethod tug_navigation_tools::calculate_rotationRequest
  (:response () (instance tug_navigation_tools::calculate_rotationResponse :init)))

(setf (get tug_navigation_tools::calculate_rotationRequest :md5sum-) "d61b10bf9711ffd345b1e65c96b513fa")
(setf (get tug_navigation_tools::calculate_rotationRequest :datatype-) "tug_navigation_tools/calculate_rotationRequest")
(setf (get tug_navigation_tools::calculate_rotationRequest :definition-)
      "nav_msgs/Path path

================================================================================
MSG: nav_msgs/Path
#An array of poses that represents a Path for a robot to follow
Header header
geometry_msgs/PoseStamped[] poses

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
float64 angle
")

(setf (get tug_navigation_tools::calculate_rotationResponse :md5sum-) "d61b10bf9711ffd345b1e65c96b513fa")
(setf (get tug_navigation_tools::calculate_rotationResponse :datatype-) "tug_navigation_tools/calculate_rotationResponse")
(setf (get tug_navigation_tools::calculate_rotationResponse :definition-)
      "nav_msgs/Path path

================================================================================
MSG: nav_msgs/Path
#An array of poses that represents a Path for a robot to follow
Header header
geometry_msgs/PoseStamped[] poses

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
float64 angle
")



(provide :tug_navigation_tools/calculate_rotation "d61b10bf9711ffd345b1e65c96b513fa")


