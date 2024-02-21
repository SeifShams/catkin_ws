;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::trajectory)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'trajectory (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::TRAJECTORY")
  (make-package "TUG_NAVIGATION_TOOLS::TRAJECTORY"))
(unless (find-package "TUG_NAVIGATION_TOOLS::TRAJECTORYREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::TRAJECTORYREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::TRAJECTORYRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::TRAJECTORYRESPONSE"))

(in-package "ROS")

(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))




(defclass tug_navigation_tools::trajectoryRequest
  :super ros::object
  :slots (_path ))

(defmethod tug_navigation_tools::trajectoryRequest
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

(defclass tug_navigation_tools::trajectoryResponse
  :super ros::object
  :slots (_reply ))

(defmethod tug_navigation_tools::trajectoryResponse
  (:init
   (&key
    ((:reply __reply) nil)
    )
   (send-super :init)
   (setq _reply __reply)
   self)
  (:reply
   (&optional (__reply :null))
   (if (not (eq __reply :null)) (setq _reply __reply)) _reply)
  (:serialization-length
   ()
   (+
    ;; bool _reply
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reply
       (if _reply (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reply
     (setq _reply (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass tug_navigation_tools::trajectory
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::trajectory :md5sum-) "9c140831c8ebdf2162ee01b665104ff7")
(setf (get tug_navigation_tools::trajectory :datatype-) "tug_navigation_tools/trajectory")
(setf (get tug_navigation_tools::trajectory :request) tug_navigation_tools::trajectoryRequest)
(setf (get tug_navigation_tools::trajectory :response) tug_navigation_tools::trajectoryResponse)

(defmethod tug_navigation_tools::trajectoryRequest
  (:response () (instance tug_navigation_tools::trajectoryResponse :init)))

(setf (get tug_navigation_tools::trajectoryRequest :md5sum-) "9c140831c8ebdf2162ee01b665104ff7")
(setf (get tug_navigation_tools::trajectoryRequest :datatype-) "tug_navigation_tools/trajectoryRequest")
(setf (get tug_navigation_tools::trajectoryRequest :definition-)
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
bool reply
")

(setf (get tug_navigation_tools::trajectoryResponse :md5sum-) "9c140831c8ebdf2162ee01b665104ff7")
(setf (get tug_navigation_tools::trajectoryResponse :datatype-) "tug_navigation_tools/trajectoryResponse")
(setf (get tug_navigation_tools::trajectoryResponse :definition-)
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
bool reply
")



(provide :tug_navigation_tools/trajectory "9c140831c8ebdf2162ee01b665104ff7")


