; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude calculate_rotation-request.msg.html

(cl:defclass <calculate_rotation-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type nav_msgs-msg:Path
    :initform (cl:make-instance 'nav_msgs-msg:Path)))
)

(cl:defclass calculate_rotation-request (<calculate_rotation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calculate_rotation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calculate_rotation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<calculate_rotation-request> is deprecated: use tug_navigation_tools-srv:calculate_rotation-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <calculate_rotation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:path-val is deprecated.  Use tug_navigation_tools-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calculate_rotation-request>) ostream)
  "Serializes a message object of type '<calculate_rotation-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calculate_rotation-request>) istream)
  "Deserializes a message object of type '<calculate_rotation-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calculate_rotation-request>)))
  "Returns string type for a service object of type '<calculate_rotation-request>"
  "tug_navigation_tools/calculate_rotationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calculate_rotation-request)))
  "Returns string type for a service object of type 'calculate_rotation-request"
  "tug_navigation_tools/calculate_rotationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calculate_rotation-request>)))
  "Returns md5sum for a message object of type '<calculate_rotation-request>"
  "d61b10bf9711ffd345b1e65c96b513fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calculate_rotation-request)))
  "Returns md5sum for a message object of type 'calculate_rotation-request"
  "d61b10bf9711ffd345b1e65c96b513fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calculate_rotation-request>)))
  "Returns full string definition for message of type '<calculate_rotation-request>"
  (cl:format cl:nil "nav_msgs/Path path~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calculate_rotation-request)))
  "Returns full string definition for message of type 'calculate_rotation-request"
  (cl:format cl:nil "nav_msgs/Path path~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calculate_rotation-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calculate_rotation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'calculate_rotation-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude calculate_rotation-response.msg.html

(cl:defclass <calculate_rotation-response> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass calculate_rotation-response (<calculate_rotation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calculate_rotation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calculate_rotation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<calculate_rotation-response> is deprecated: use tug_navigation_tools-srv:calculate_rotation-response instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <calculate_rotation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:angle-val is deprecated.  Use tug_navigation_tools-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calculate_rotation-response>) ostream)
  "Serializes a message object of type '<calculate_rotation-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calculate_rotation-response>) istream)
  "Deserializes a message object of type '<calculate_rotation-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calculate_rotation-response>)))
  "Returns string type for a service object of type '<calculate_rotation-response>"
  "tug_navigation_tools/calculate_rotationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calculate_rotation-response)))
  "Returns string type for a service object of type 'calculate_rotation-response"
  "tug_navigation_tools/calculate_rotationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calculate_rotation-response>)))
  "Returns md5sum for a message object of type '<calculate_rotation-response>"
  "d61b10bf9711ffd345b1e65c96b513fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calculate_rotation-response)))
  "Returns md5sum for a message object of type 'calculate_rotation-response"
  "d61b10bf9711ffd345b1e65c96b513fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calculate_rotation-response>)))
  "Returns full string definition for message of type '<calculate_rotation-response>"
  (cl:format cl:nil "float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calculate_rotation-response)))
  "Returns full string definition for message of type 'calculate_rotation-response"
  (cl:format cl:nil "float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calculate_rotation-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calculate_rotation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'calculate_rotation-response
    (cl:cons ':angle (angle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'calculate_rotation)))
  'calculate_rotation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'calculate_rotation)))
  'calculate_rotation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calculate_rotation)))
  "Returns string type for a service object of type '<calculate_rotation>"
  "tug_navigation_tools/calculate_rotation")