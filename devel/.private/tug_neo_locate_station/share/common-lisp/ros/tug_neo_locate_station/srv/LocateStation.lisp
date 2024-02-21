; Auto-generated. Do not edit!


(cl:in-package tug_neo_locate_station-srv)


;//! \htmlinclude LocateStation-request.msg.html

(cl:defclass <LocateStation-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass LocateStation-request (<LocateStation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocateStation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocateStation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_neo_locate_station-srv:<LocateStation-request> is deprecated: use tug_neo_locate_station-srv:LocateStation-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocateStation-request>) ostream)
  "Serializes a message object of type '<LocateStation-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocateStation-request>) istream)
  "Deserializes a message object of type '<LocateStation-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocateStation-request>)))
  "Returns string type for a service object of type '<LocateStation-request>"
  "tug_neo_locate_station/LocateStationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocateStation-request)))
  "Returns string type for a service object of type 'LocateStation-request"
  "tug_neo_locate_station/LocateStationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocateStation-request>)))
  "Returns md5sum for a message object of type '<LocateStation-request>"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocateStation-request)))
  "Returns md5sum for a message object of type 'LocateStation-request"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocateStation-request>)))
  "Returns full string definition for message of type '<LocateStation-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocateStation-request)))
  "Returns full string definition for message of type 'LocateStation-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocateStation-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocateStation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LocateStation-request
))
;//! \htmlinclude LocateStation-response.msg.html

(cl:defclass <LocateStation-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LocateStation-response (<LocateStation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocateStation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocateStation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tug_neo_locate_station-srv:<LocateStation-response> is deprecated: use tug_neo_locate_station-srv:LocateStation-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <LocateStation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tug_neo_locate_station-srv:reached-val is deprecated.  Use tug_neo_locate_station-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocateStation-response>) ostream)
  "Serializes a message object of type '<LocateStation-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocateStation-response>) istream)
  "Deserializes a message object of type '<LocateStation-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocateStation-response>)))
  "Returns string type for a service object of type '<LocateStation-response>"
  "tug_neo_locate_station/LocateStationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocateStation-response)))
  "Returns string type for a service object of type 'LocateStation-response"
  "tug_neo_locate_station/LocateStationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocateStation-response>)))
  "Returns md5sum for a message object of type '<LocateStation-response>"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocateStation-response)))
  "Returns md5sum for a message object of type 'LocateStation-response"
  "80204a6ff2622a7071680d5597cbd3aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocateStation-response>)))
  "Returns full string definition for message of type '<LocateStation-response>"
  (cl:format cl:nil "~%# returns whether position was reached successfully~%bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocateStation-response)))
  "Returns full string definition for message of type 'LocateStation-response"
  (cl:format cl:nil "~%# returns whether position was reached successfully~%bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocateStation-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocateStation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LocateStation-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LocateStation)))
  'LocateStation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LocateStation)))
  'LocateStation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocateStation)))
  "Returns string type for a service object of type '<LocateStation>"
  "tug_neo_locate_station/LocateStation")