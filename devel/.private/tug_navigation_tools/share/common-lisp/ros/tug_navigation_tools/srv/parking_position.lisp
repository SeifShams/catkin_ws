; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude parking_position-request.msg.html

(cl:defclass <parking_position-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass parking_position-request (<parking_position-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parking_position-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parking_position-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<parking_position-request> is deprecated: use tug_navigation_tools-srv:parking_position-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <parking_position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:x-val is deprecated.  Use tug_navigation_tools-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <parking_position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:y-val is deprecated.  Use tug_navigation_tools-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <parking_position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:distance-val is deprecated.  Use tug_navigation_tools-srv:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parking_position-request>) ostream)
  "Serializes a message object of type '<parking_position-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parking_position-request>) istream)
  "Deserializes a message object of type '<parking_position-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parking_position-request>)))
  "Returns string type for a service object of type '<parking_position-request>"
  "tug_navigation_tools/parking_positionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking_position-request)))
  "Returns string type for a service object of type 'parking_position-request"
  "tug_navigation_tools/parking_positionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parking_position-request>)))
  "Returns md5sum for a message object of type '<parking_position-request>"
  "9cccc68cdb448b7a1440e1b408ee11bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parking_position-request)))
  "Returns md5sum for a message object of type 'parking_position-request"
  "9cccc68cdb448b7a1440e1b408ee11bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parking_position-request>)))
  "Returns full string definition for message of type '<parking_position-request>"
  (cl:format cl:nil "# x-position of the table~%float64 x~%~%# y-position of the table~%float64 y~%~%# distance between border of table and Eisenschwein~%float64 distance~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parking_position-request)))
  "Returns full string definition for message of type 'parking_position-request"
  (cl:format cl:nil "# x-position of the table~%float64 x~%~%# y-position of the table~%float64 y~%~%# distance between border of table and Eisenschwein~%float64 distance~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parking_position-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parking_position-request>))
  "Converts a ROS message object to a list"
  (cl:list 'parking_position-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':distance (distance msg))
))
;//! \htmlinclude parking_position-response.msg.html

(cl:defclass <parking_position-response> (roslisp-msg-protocol:ros-message)
  ((new_parking_position
    :reader new_parking_position
    :initarg :new_parking_position
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (position_found
    :reader position_found
    :initarg :position_found
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass parking_position-response (<parking_position-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parking_position-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parking_position-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<parking_position-response> is deprecated: use tug_navigation_tools-srv:parking_position-response instead.")))

(cl:ensure-generic-function 'new_parking_position-val :lambda-list '(m))
(cl:defmethod new_parking_position-val ((m <parking_position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:new_parking_position-val is deprecated.  Use tug_navigation_tools-srv:new_parking_position instead.")
  (new_parking_position m))

(cl:ensure-generic-function 'position_found-val :lambda-list '(m))
(cl:defmethod position_found-val ((m <parking_position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:position_found-val is deprecated.  Use tug_navigation_tools-srv:position_found instead.")
  (position_found m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parking_position-response>) ostream)
  "Serializes a message object of type '<parking_position-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'new_parking_position) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'position_found) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parking_position-response>) istream)
  "Deserializes a message object of type '<parking_position-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'new_parking_position) istream)
    (cl:setf (cl:slot-value msg 'position_found) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parking_position-response>)))
  "Returns string type for a service object of type '<parking_position-response>"
  "tug_navigation_tools/parking_positionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking_position-response)))
  "Returns string type for a service object of type 'parking_position-response"
  "tug_navigation_tools/parking_positionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parking_position-response>)))
  "Returns md5sum for a message object of type '<parking_position-response>"
  "9cccc68cdb448b7a1440e1b408ee11bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parking_position-response)))
  "Returns md5sum for a message object of type 'parking_position-response"
  "9cccc68cdb448b7a1440e1b408ee11bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parking_position-response>)))
  "Returns full string definition for message of type '<parking_position-response>"
  (cl:format cl:nil "~%# parking position of the Eisenschwein, only valid if position_found is true~%geometry_msgs/Pose new_parking_position~%~%# information whether a potential parking position was found or not~%bool position_found~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parking_position-response)))
  "Returns full string definition for message of type 'parking_position-response"
  (cl:format cl:nil "~%# parking position of the Eisenschwein, only valid if position_found is true~%geometry_msgs/Pose new_parking_position~%~%# information whether a potential parking position was found or not~%bool position_found~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parking_position-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'new_parking_position))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parking_position-response>))
  "Converts a ROS message object to a list"
  (cl:list 'parking_position-response
    (cl:cons ':new_parking_position (new_parking_position msg))
    (cl:cons ':position_found (position_found msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'parking_position)))
  'parking_position-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'parking_position)))
  'parking_position-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking_position)))
  "Returns string type for a service object of type '<parking_position>"
  "tug_navigation_tools/parking_position")