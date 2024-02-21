; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude FinePositioning-request.msg.html

(cl:defclass <FinePositioning-request> (roslisp-msg-protocol:ros-message)
  ((wall_position
    :reader wall_position
    :initarg :wall_position
    :type cl:integer
    :initform 0)
   (goal_distance
    :reader goal_distance
    :initarg :goal_distance
    :type cl:float
    :initform 0.0)
   (initial_distance
    :reader initial_distance
    :initarg :initial_distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass FinePositioning-request (<FinePositioning-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FinePositioning-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FinePositioning-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<FinePositioning-request> is deprecated: use tug_navigation_tools-srv:FinePositioning-request instead.")))

(cl:ensure-generic-function 'wall_position-val :lambda-list '(m))
(cl:defmethod wall_position-val ((m <FinePositioning-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:wall_position-val is deprecated.  Use tug_navigation_tools-srv:wall_position instead.")
  (wall_position m))

(cl:ensure-generic-function 'goal_distance-val :lambda-list '(m))
(cl:defmethod goal_distance-val ((m <FinePositioning-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:goal_distance-val is deprecated.  Use tug_navigation_tools-srv:goal_distance instead.")
  (goal_distance m))

(cl:ensure-generic-function 'initial_distance-val :lambda-list '(m))
(cl:defmethod initial_distance-val ((m <FinePositioning-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:initial_distance-val is deprecated.  Use tug_navigation_tools-srv:initial_distance instead.")
  (initial_distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FinePositioning-request>) ostream)
  "Serializes a message object of type '<FinePositioning-request>"
  (cl:let* ((signed (cl:slot-value msg 'wall_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'initial_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FinePositioning-request>) istream)
  "Deserializes a message object of type '<FinePositioning-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wall_position) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initial_distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FinePositioning-request>)))
  "Returns string type for a service object of type '<FinePositioning-request>"
  "tug_navigation_tools/FinePositioningRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FinePositioning-request)))
  "Returns string type for a service object of type 'FinePositioning-request"
  "tug_navigation_tools/FinePositioningRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FinePositioning-request>)))
  "Returns md5sum for a message object of type '<FinePositioning-request>"
  "171c107e3dd8cdfa8ae691b15d06b1d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FinePositioning-request)))
  "Returns md5sum for a message object of type 'FinePositioning-request"
  "171c107e3dd8cdfa8ae691b15d06b1d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FinePositioning-request>)))
  "Returns full string definition for message of type '<FinePositioning-request>"
  (cl:format cl:nil "# indicator on which side of the Eisenschwein the wall is positioned: 1 = starboard; -1 = port ~%int64 wall_position~%~%# distance between border of table and Eisenschwein~%float64 goal_distance~%float64 initial_distance~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FinePositioning-request)))
  "Returns full string definition for message of type 'FinePositioning-request"
  (cl:format cl:nil "# indicator on which side of the Eisenschwein the wall is positioned: 1 = starboard; -1 = port ~%int64 wall_position~%~%# distance between border of table and Eisenschwein~%float64 goal_distance~%float64 initial_distance~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FinePositioning-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FinePositioning-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FinePositioning-request
    (cl:cons ':wall_position (wall_position msg))
    (cl:cons ':goal_distance (goal_distance msg))
    (cl:cons ':initial_distance (initial_distance msg))
))
;//! \htmlinclude FinePositioning-response.msg.html

(cl:defclass <FinePositioning-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass FinePositioning-response (<FinePositioning-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FinePositioning-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FinePositioning-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<FinePositioning-response> is deprecated: use tug_navigation_tools-srv:FinePositioning-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <FinePositioning-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:reached-val is deprecated.  Use tug_navigation_tools-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FinePositioning-response>) ostream)
  "Serializes a message object of type '<FinePositioning-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FinePositioning-response>) istream)
  "Deserializes a message object of type '<FinePositioning-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FinePositioning-response>)))
  "Returns string type for a service object of type '<FinePositioning-response>"
  "tug_navigation_tools/FinePositioningResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FinePositioning-response)))
  "Returns string type for a service object of type 'FinePositioning-response"
  "tug_navigation_tools/FinePositioningResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FinePositioning-response>)))
  "Returns md5sum for a message object of type '<FinePositioning-response>"
  "171c107e3dd8cdfa8ae691b15d06b1d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FinePositioning-response)))
  "Returns md5sum for a message object of type 'FinePositioning-response"
  "171c107e3dd8cdfa8ae691b15d06b1d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FinePositioning-response>)))
  "Returns full string definition for message of type '<FinePositioning-response>"
  (cl:format cl:nil "~%# returns whether position was reached successfully~%bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FinePositioning-response)))
  "Returns full string definition for message of type 'FinePositioning-response"
  (cl:format cl:nil "~%# returns whether position was reached successfully~%bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FinePositioning-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FinePositioning-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FinePositioning-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FinePositioning)))
  'FinePositioning-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FinePositioning)))
  'FinePositioning-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FinePositioning)))
  "Returns string type for a service object of type '<FinePositioning>"
  "tug_navigation_tools/FinePositioning")