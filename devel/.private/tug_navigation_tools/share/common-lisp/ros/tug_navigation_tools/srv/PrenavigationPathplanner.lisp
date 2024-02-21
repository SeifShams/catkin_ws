; Auto-generated. Do not edit!


(cl:in-package tug_navigation_tools-srv)


;//! \htmlinclude PrenavigationPathplanner-request.msg.html

(cl:defclass <PrenavigationPathplanner-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PrenavigationPathplanner-request (<PrenavigationPathplanner-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PrenavigationPathplanner-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PrenavigationPathplanner-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<PrenavigationPathplanner-request> is deprecated: use tug_navigation_tools-srv:PrenavigationPathplanner-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PrenavigationPathplanner-request>) ostream)
  "Serializes a message object of type '<PrenavigationPathplanner-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PrenavigationPathplanner-request>) istream)
  "Deserializes a message object of type '<PrenavigationPathplanner-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PrenavigationPathplanner-request>)))
  "Returns string type for a service object of type '<PrenavigationPathplanner-request>"
  "tug_navigation_tools/PrenavigationPathplannerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrenavigationPathplanner-request)))
  "Returns string type for a service object of type 'PrenavigationPathplanner-request"
  "tug_navigation_tools/PrenavigationPathplannerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PrenavigationPathplanner-request>)))
  "Returns md5sum for a message object of type '<PrenavigationPathplanner-request>"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PrenavigationPathplanner-request)))
  "Returns md5sum for a message object of type 'PrenavigationPathplanner-request"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PrenavigationPathplanner-request>)))
  "Returns full string definition for message of type '<PrenavigationPathplanner-request>"
  (cl:format cl:nil "#nav_msgs/Path path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PrenavigationPathplanner-request)))
  "Returns full string definition for message of type 'PrenavigationPathplanner-request"
  (cl:format cl:nil "#nav_msgs/Path path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PrenavigationPathplanner-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PrenavigationPathplanner-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PrenavigationPathplanner-request
))
;//! \htmlinclude PrenavigationPathplanner-response.msg.html

(cl:defclass <PrenavigationPathplanner-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PrenavigationPathplanner-response (<PrenavigationPathplanner-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PrenavigationPathplanner-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PrenavigationPathplanner-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_navigation_tools-srv:<PrenavigationPathplanner-response> is deprecated: use tug_navigation_tools-srv:PrenavigationPathplanner-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <PrenavigationPathplanner-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_navigation_tools-srv:reached-val is deprecated.  Use tug_navigation_tools-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PrenavigationPathplanner-response>) ostream)
  "Serializes a message object of type '<PrenavigationPathplanner-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PrenavigationPathplanner-response>) istream)
  "Deserializes a message object of type '<PrenavigationPathplanner-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PrenavigationPathplanner-response>)))
  "Returns string type for a service object of type '<PrenavigationPathplanner-response>"
  "tug_navigation_tools/PrenavigationPathplannerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrenavigationPathplanner-response)))
  "Returns string type for a service object of type 'PrenavigationPathplanner-response"
  "tug_navigation_tools/PrenavigationPathplannerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PrenavigationPathplanner-response>)))
  "Returns md5sum for a message object of type '<PrenavigationPathplanner-response>"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PrenavigationPathplanner-response)))
  "Returns md5sum for a message object of type 'PrenavigationPathplanner-response"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PrenavigationPathplanner-response>)))
  "Returns full string definition for message of type '<PrenavigationPathplanner-response>"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PrenavigationPathplanner-response)))
  "Returns full string definition for message of type 'PrenavigationPathplanner-response"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PrenavigationPathplanner-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PrenavigationPathplanner-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PrenavigationPathplanner-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PrenavigationPathplanner)))
  'PrenavigationPathplanner-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PrenavigationPathplanner)))
  'PrenavigationPathplanner-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrenavigationPathplanner)))
  "Returns string type for a service object of type '<PrenavigationPathplanner>"
  "tug_navigation_tools/PrenavigationPathplanner")