; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude rotational_movement-request.msg.html

(cl:defclass <rotational_movement-request> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass rotational_movement-request (<rotational_movement-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rotational_movement-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rotational_movement-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<rotational_movement-request> is deprecated: use tug_navigation_tools-srv:rotational_movement-request instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <rotational_movement-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:angle-val is deprecated.  Use tug_navigation_tools-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rotational_movement-request>) ostream)
  "Serializes a message object of type '<rotational_movement-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rotational_movement-request>) istream)
  "Deserializes a message object of type '<rotational_movement-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rotational_movement-request>)))
  "Returns string type for a service object of type '<rotational_movement-request>"
  "tug_navigation_tools/rotational_movementRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotational_movement-request)))
  "Returns string type for a service object of type 'rotational_movement-request"
  "tug_navigation_tools/rotational_movementRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rotational_movement-request>)))
  "Returns md5sum for a message object of type '<rotational_movement-request>"
  "b8e92220d3a386937ac91ac3abd87983")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rotational_movement-request)))
  "Returns md5sum for a message object of type 'rotational_movement-request"
  "b8e92220d3a386937ac91ac3abd87983")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rotational_movement-request>)))
  "Returns full string definition for message of type '<rotational_movement-request>"
  (cl:format cl:nil "float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rotational_movement-request)))
  "Returns full string definition for message of type 'rotational_movement-request"
  (cl:format cl:nil "float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rotational_movement-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rotational_movement-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rotational_movement-request
    (cl:cons ':angle (angle msg))
))
;//! \htmlinclude rotational_movement-response.msg.html

(cl:defclass <rotational_movement-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass rotational_movement-response (<rotational_movement-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rotational_movement-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rotational_movement-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<rotational_movement-response> is deprecated: use tug_navigation_tools-srv:rotational_movement-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <rotational_movement-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:reached-val is deprecated.  Use tug_navigation_tools-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rotational_movement-response>) ostream)
  "Serializes a message object of type '<rotational_movement-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rotational_movement-response>) istream)
  "Deserializes a message object of type '<rotational_movement-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rotational_movement-response>)))
  "Returns string type for a service object of type '<rotational_movement-response>"
  "tug_navigation_tools/rotational_movementResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotational_movement-response)))
  "Returns string type for a service object of type 'rotational_movement-response"
  "tug_navigation_tools/rotational_movementResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rotational_movement-response>)))
  "Returns md5sum for a message object of type '<rotational_movement-response>"
  "b8e92220d3a386937ac91ac3abd87983")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rotational_movement-response)))
  "Returns md5sum for a message object of type 'rotational_movement-response"
  "b8e92220d3a386937ac91ac3abd87983")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rotational_movement-response>)))
  "Returns full string definition for message of type '<rotational_movement-response>"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rotational_movement-response)))
  "Returns full string definition for message of type 'rotational_movement-response"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rotational_movement-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rotational_movement-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rotational_movement-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rotational_movement)))
  'rotational_movement-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rotational_movement)))
  'rotational_movement-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotational_movement)))
  "Returns string type for a service object of type '<rotational_movement>"
  "tug_navigation_tools/rotational_movement")