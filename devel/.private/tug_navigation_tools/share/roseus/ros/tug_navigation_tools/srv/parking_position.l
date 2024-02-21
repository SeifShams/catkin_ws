;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::parking_position)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'parking_position (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::PARKING_POSITION")
  (make-package "TUG_NAVIGATION_TOOLS::PARKING_POSITION"))
(unless (find-package "TUG_NAVIGATION_TOOLS::PARKING_POSITIONREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::PARKING_POSITIONREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::PARKING_POSITIONRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::PARKING_POSITIONRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass tug_navigation_tools::parking_positionRequest
  :super ros::object
  :slots (_x _y _distance ))

(defmethod tug_navigation_tools::parking_positionRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _distance (float __distance))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tug_navigation_tools::parking_positionResponse
  :super ros::object
  :slots (_new_parking_position _position_found ))

(defmethod tug_navigation_tools::parking_positionResponse
  (:init
   (&key
    ((:new_parking_position __new_parking_position) (instance geometry_msgs::Pose :init))
    ((:position_found __position_found) nil)
    )
   (send-super :init)
   (setq _new_parking_position __new_parking_position)
   (setq _position_found __position_found)
   self)
  (:new_parking_position
   (&rest __new_parking_position)
   (if (keywordp (car __new_parking_position))
       (send* _new_parking_position __new_parking_position)
     (progn
       (if __new_parking_position (setq _new_parking_position (car __new_parking_position)))
       _new_parking_position)))
  (:position_found
   (&optional (__position_found :null))
   (if (not (eq __position_found :null)) (setq _position_found __position_found)) _position_found)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _new_parking_position
    (send _new_parking_position :serialization-length)
    ;; bool _position_found
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _new_parking_position
       (send _new_parking_position :serialize s)
     ;; bool _position_found
       (if _position_found (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _new_parking_position
     (send _new_parking_position :deserialize buf ptr-) (incf ptr- (send _new_parking_position :serialization-length))
   ;; bool _position_found
     (setq _position_found (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass tug_navigation_tools::parking_position
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::parking_position :md5sum-) "9cccc68cdb448b7a1440e1b408ee11bd")
(setf (get tug_navigation_tools::parking_position :datatype-) "tug_navigation_tools/parking_position")
(setf (get tug_navigation_tools::parking_position :request) tug_navigation_tools::parking_positionRequest)
(setf (get tug_navigation_tools::parking_position :response) tug_navigation_tools::parking_positionResponse)

(defmethod tug_navigation_tools::parking_positionRequest
  (:response () (instance tug_navigation_tools::parking_positionResponse :init)))

(setf (get tug_navigation_tools::parking_positionRequest :md5sum-) "9cccc68cdb448b7a1440e1b408ee11bd")
(setf (get tug_navigation_tools::parking_positionRequest :datatype-) "tug_navigation_tools/parking_positionRequest")
(setf (get tug_navigation_tools::parking_positionRequest :definition-)
      "# x-position of the table
float64 x

# y-position of the table
float64 y

# distance between border of table and Eisenschwein
float64 distance

---

# parking position of the Eisenschwein, only valid if position_found is true
geometry_msgs/Pose new_parking_position

# information whether a potential parking position was found or not
bool position_found


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
")

(setf (get tug_navigation_tools::parking_positionResponse :md5sum-) "9cccc68cdb448b7a1440e1b408ee11bd")
(setf (get tug_navigation_tools::parking_positionResponse :datatype-) "tug_navigation_tools/parking_positionResponse")
(setf (get tug_navigation_tools::parking_positionResponse :definition-)
      "# x-position of the table
float64 x

# y-position of the table
float64 y

# distance between border of table and Eisenschwein
float64 distance

---

# parking position of the Eisenschwein, only valid if position_found is true
geometry_msgs/Pose new_parking_position

# information whether a potential parking position was found or not
bool position_found


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
")



(provide :tug_navigation_tools/parking_position "9cccc68cdb448b7a1440e1b408ee11bd")


