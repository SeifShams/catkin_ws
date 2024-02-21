; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude translational_movement-request.msg.html

(cl:defclass <translational_movement-request> (roslisp-msg-protocol:ros-message)
  ((back_and_forth
    :reader back_and_forth
    :initarg :back_and_forth
    :type cl:float
    :initform 0.0)
   (side_to_side
    :reader side_to_side
    :initarg :side_to_side
    :type cl:float
    :initform 0.0))
)

(cl:defclass translational_movement-request (<translational_movement-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <translational_movement-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'translational_movement-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<translational_movement-request> is deprecated: use tug_navigation_tools-srv:translational_movement-request instead.")))

(cl:ensure-generic-function 'back_and_forth-val :lambda-list '(m))
(cl:defmethod back_and_forth-val ((m <translational_movement-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:back_and_forth-val is deprecated.  Use tug_navigation_tools-srv:back_and_forth instead.")
  (back_and_forth m))

(cl:ensure-generic-function 'side_to_side-val :lambda-list '(m))
(cl:defmethod side_to_side-val ((m <translational_movement-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:side_to_side-val is deprecated.  Use tug_navigation_tools-srv:side_to_side instead.")
  (side_to_side m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <translational_movement-request>) ostream)
  "Serializes a message object of type '<translational_movement-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'back_and_forth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'side_to_side))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <translational_movement-request>) istream)
  "Deserializes a message object of type '<translational_movement-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'back_and_forth) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'side_to_side) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<translational_movement-request>)))
  "Returns string type for a service object of type '<translational_movement-request>"
  "tug_navigation_tools/translational_movementRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'translational_movement-request)))
  "Returns string type for a service object of type 'translational_movement-request"
  "tug_navigation_tools/translational_movementRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<translational_movement-request>)))
  "Returns md5sum for a message object of type '<translational_movement-request>"
  "0394d208a08b3715c1bf38023b0d4e4e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'translational_movement-request)))
  "Returns md5sum for a message object of type 'translational_movement-request"
  "0394d208a08b3715c1bf38023b0d4e4e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<translational_movement-request>)))
  "Returns full string definition for message of type '<translational_movement-request>"
  (cl:format cl:nil "float64 back_and_forth~%float64 side_to_side~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'translational_movement-request)))
  "Returns full string definition for message of type 'translational_movement-request"
  (cl:format cl:nil "float64 back_and_forth~%float64 side_to_side~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <translational_movement-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <translational_movement-request>))
  "Converts a ROS message object to a list"
  (cl:list 'translational_movement-request
    (cl:cons ':back_and_forth (back_and_forth msg))
    (cl:cons ':side_to_side (side_to_side msg))
))
;//! \htmlinclude translational_movement-response.msg.html

(cl:defclass <translational_movement-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass translational_movement-response (<translational_movement-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <translational_movement-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'translational_movement-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<translational_movement-response> is deprecated: use tug_navigation_tools-srv:translational_movement-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <translational_movement-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:reached-val is deprecated.  Use tug_navigation_tools-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <translational_movement-response>) ostream)
  "Serializes a message object of type '<translational_movement-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <translational_movement-response>) istream)
  "Deserializes a message object of type '<translational_movement-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<translational_movement-response>)))
  "Returns string type for a service object of type '<translational_movement-response>"
  "tug_navigation_tools/translational_movementResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'translational_movement-response)))
  "Returns string type for a service object of type 'translational_movement-response"
  "tug_navigation_tools/translational_movementResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<translational_movement-response>)))
  "Returns md5sum for a message object of type '<translational_movement-response>"
  "0394d208a08b3715c1bf38023b0d4e4e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'translational_movement-response)))
  "Returns md5sum for a message object of type 'translational_movement-response"
  "0394d208a08b3715c1bf38023b0d4e4e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<translational_movement-response>)))
  "Returns full string definition for message of type '<translational_movement-response>"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'translational_movement-response)))
  "Returns full string definition for message of type 'translational_movement-response"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <translational_movement-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <translational_movement-response>))
  "Converts a ROS message object to a list"
  (cl:list 'translational_movement-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'translational_movement)))
  'translational_movement-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'translational_movement)))
  'translational_movement-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'translational_movement)))
  "Returns string type for a service object of type '<translational_movement>"
  "tug_navigation_tools/translational_movement")