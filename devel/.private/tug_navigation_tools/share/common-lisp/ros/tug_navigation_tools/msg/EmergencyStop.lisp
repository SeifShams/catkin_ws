; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-msg)


;//! \htmlinclude EmergencyStop.msg.html

(cl:defclass <EmergencyStop> (roslisp-msg-protocol:ros-message)
  ((stop_cmd
    :reader stop_cmd
    :initarg :stop_cmd
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass EmergencyStop (<EmergencyStop>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EmergencyStop>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EmergencyStop)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-msg:<EmergencyStop> is deprecated: use tug_navigation_tools-msg:EmergencyStop instead.")))

(cl:ensure-generic-function 'stop_cmd-val :lambda-list '(m))
(cl:defmethod stop_cmd-val ((m <EmergencyStop>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-msg:stop_cmd-val is deprecated.  Use tug_navigation_tools-msg:stop_cmd instead.")
  (stop_cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EmergencyStop>) ostream)
  "Serializes a message object of type '<EmergencyStop>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stop_cmd) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EmergencyStop>) istream)
  "Deserializes a message object of type '<EmergencyStop>"
    (cl:setf (cl:slot-value msg 'stop_cmd) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EmergencyStop>)))
  "Returns string type for a message object of type '<EmergencyStop>"
  "tug_navigation_tools/EmergencyStop")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EmergencyStop)))
  "Returns string type for a message object of type 'EmergencyStop"
  "tug_navigation_tools/EmergencyStop")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EmergencyStop>)))
  "Returns md5sum for a message object of type '<EmergencyStop>"
  "a8c75689c02fa4ef8f26e5152b43ecdd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EmergencyStop)))
  "Returns md5sum for a message object of type 'EmergencyStop"
  "a8c75689c02fa4ef8f26e5152b43ecdd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EmergencyStop>)))
  "Returns full string definition for message of type '<EmergencyStop>"
  (cl:format cl:nil "bool stop_cmd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EmergencyStop)))
  "Returns full string definition for message of type 'EmergencyStop"
  (cl:format cl:nil "bool stop_cmd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EmergencyStop>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EmergencyStop>))
  "Converts a ROS message object to a list"
  (cl:list 'EmergencyStop
    (cl:cons ':stop_cmd (stop_cmd msg))
))
