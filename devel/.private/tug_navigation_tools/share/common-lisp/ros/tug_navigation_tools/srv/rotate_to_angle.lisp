; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude rotate_to_angle-request.msg.html

(cl:defclass <rotate_to_angle-request> (roslisp-msg-protocol:ros-message)
  ((desired_phi
    :reader desired_phi
    :initarg :desired_phi
    :type cl:float
    :initform 0.0))
)

(cl:defclass rotate_to_angle-request (<rotate_to_angle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rotate_to_angle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rotate_to_angle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<rotate_to_angle-request> is deprecated: use tug_navigation_tools-srv:rotate_to_angle-request instead.")))

(cl:ensure-generic-function 'desired_phi-val :lambda-list '(m))
(cl:defmethod desired_phi-val ((m <rotate_to_angle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:desired_phi-val is deprecated.  Use tug_navigation_tools-srv:desired_phi instead.")
  (desired_phi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rotate_to_angle-request>) ostream)
  "Serializes a message object of type '<rotate_to_angle-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'desired_phi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rotate_to_angle-request>) istream)
  "Deserializes a message object of type '<rotate_to_angle-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desired_phi) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rotate_to_angle-request>)))
  "Returns string type for a service object of type '<rotate_to_angle-request>"
  "tug_navigation_tools/rotate_to_angleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotate_to_angle-request)))
  "Returns string type for a service object of type 'rotate_to_angle-request"
  "tug_navigation_tools/rotate_to_angleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rotate_to_angle-request>)))
  "Returns md5sum for a message object of type '<rotate_to_angle-request>"
  "bd2782be2069801f5722cbaf3da80be1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rotate_to_angle-request)))
  "Returns md5sum for a message object of type 'rotate_to_angle-request"
  "bd2782be2069801f5722cbaf3da80be1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rotate_to_angle-request>)))
  "Returns full string definition for message of type '<rotate_to_angle-request>"
  (cl:format cl:nil "float64 desired_phi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rotate_to_angle-request)))
  "Returns full string definition for message of type 'rotate_to_angle-request"
  (cl:format cl:nil "float64 desired_phi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rotate_to_angle-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rotate_to_angle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rotate_to_angle-request
    (cl:cons ':desired_phi (desired_phi msg))
))
;//! \htmlinclude rotate_to_angle-response.msg.html

(cl:defclass <rotate_to_angle-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass rotate_to_angle-response (<rotate_to_angle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rotate_to_angle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rotate_to_angle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<rotate_to_angle-response> is deprecated: use tug_navigation_tools-srv:rotate_to_angle-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <rotate_to_angle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:reached-val is deprecated.  Use tug_navigation_tools-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rotate_to_angle-response>) ostream)
  "Serializes a message object of type '<rotate_to_angle-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rotate_to_angle-response>) istream)
  "Deserializes a message object of type '<rotate_to_angle-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rotate_to_angle-response>)))
  "Returns string type for a service object of type '<rotate_to_angle-response>"
  "tug_navigation_tools/rotate_to_angleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotate_to_angle-response)))
  "Returns string type for a service object of type 'rotate_to_angle-response"
  "tug_navigation_tools/rotate_to_angleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rotate_to_angle-response>)))
  "Returns md5sum for a message object of type '<rotate_to_angle-response>"
  "bd2782be2069801f5722cbaf3da80be1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rotate_to_angle-response)))
  "Returns md5sum for a message object of type 'rotate_to_angle-response"
  "bd2782be2069801f5722cbaf3da80be1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rotate_to_angle-response>)))
  "Returns full string definition for message of type '<rotate_to_angle-response>"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rotate_to_angle-response)))
  "Returns full string definition for message of type 'rotate_to_angle-response"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rotate_to_angle-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rotate_to_angle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rotate_to_angle-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rotate_to_angle)))
  'rotate_to_angle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rotate_to_angle)))
  'rotate_to_angle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rotate_to_angle)))
  "Returns string type for a service object of type '<rotate_to_angle>"
  "tug_navigation_tools/rotate_to_angle")