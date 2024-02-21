; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude trajectory-request.msg.html

(cl:defclass <trajectory-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type nav_msgs-msg:Path
    :initform (cl:make-instance 'nav_msgs-msg:Path)))
)

(cl:defclass trajectory-request (<trajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<trajectory-request> is deprecated: use tug_navigation_tools-srv:trajectory-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <trajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:path-val is deprecated.  Use tug_navigation_tools-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trajectory-request>) ostream)
  "Serializes a message object of type '<trajectory-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trajectory-request>) istream)
  "Deserializes a message object of type '<trajectory-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<trajectory-request>)))
  "Returns string type for a service object of type '<trajectory-request>"
  "tug_navigation_tools/trajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trajectory-request)))
  "Returns string type for a service object of type 'trajectory-request"
  "tug_navigation_tools/trajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<trajectory-request>)))
  "Returns md5sum for a message object of type '<trajectory-request>"
  "9c140831c8ebdf2162ee01b665104ff7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trajectory-request)))
  "Returns md5sum for a message object of type 'trajectory-request"
  "9c140831c8ebdf2162ee01b665104ff7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trajectory-request>)))
  "Returns full string definition for message of type '<trajectory-request>"
  (cl:format cl:nil "nav_msgs/Path path~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trajectory-request)))
  "Returns full string definition for message of type 'trajectory-request"
  (cl:format cl:nil "nav_msgs/Path path~%~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trajectory-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'trajectory-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude trajectory-response.msg.html

(cl:defclass <trajectory-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass trajectory-response (<trajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <trajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'trajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<trajectory-response> is deprecated: use tug_navigation_tools-srv:trajectory-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <trajectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:reply-val is deprecated.  Use tug_navigation_tools-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <trajectory-response>) ostream)
  "Serializes a message object of type '<trajectory-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reply) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <trajectory-response>) istream)
  "Deserializes a message object of type '<trajectory-response>"
    (cl:setf (cl:slot-value msg 'reply) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<trajectory-response>)))
  "Returns string type for a service object of type '<trajectory-response>"
  "tug_navigation_tools/trajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trajectory-response)))
  "Returns string type for a service object of type 'trajectory-response"
  "tug_navigation_tools/trajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<trajectory-response>)))
  "Returns md5sum for a message object of type '<trajectory-response>"
  "9c140831c8ebdf2162ee01b665104ff7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'trajectory-response)))
  "Returns md5sum for a message object of type 'trajectory-response"
  "9c140831c8ebdf2162ee01b665104ff7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<trajectory-response>)))
  "Returns full string definition for message of type '<trajectory-response>"
  (cl:format cl:nil "bool reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'trajectory-response)))
  "Returns full string definition for message of type 'trajectory-response"
  (cl:format cl:nil "bool reply~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <trajectory-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <trajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'trajectory-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'trajectory)))
  'trajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'trajectory)))
  'trajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'trajectory)))
  "Returns string type for a service object of type '<trajectory>"
  "tug_navigation_tools/trajectory")