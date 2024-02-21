;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::rotational_movement)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'rotational_movement (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::ROTATIONAL_MOVEMENT")
  (make-package "TUG_NAVIGATION_TOOLS::ROTATIONAL_MOVEMENT"))
(unless (find-package "TUG_NAVIGATION_TOOLS::ROTATIONAL_MOVEMENTREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::ROTATIONAL_MOVEMENTREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::ROTATIONAL_MOVEMENTRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::ROTATIONAL_MOVEMENTRESPONSE"))

(in-package "ROS")





(defclass tug_navigation_tools::rotational_movementRequest
  :super ros::object
  :slots (_angle ))

(defmethod tug_navigation_tools::rotational_movementRequest
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float64 _angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tug_navigation_tools::rotational_movementResponse
  :super ros::object
  :slots (_reached ))

(defmethod tug_navigation_tools::rotational_movementResponse
  (:init
   (&key
    ((:reached __reached) nil)
    )
   (send-super :init)
   (setq _reached __reached)
   self)
  (:reached
   (&optional (__reached :null))
   (if (not (eq __reached :null)) (setq _reached __reached)) _reached)
  (:serialization-length
   ()
   (+
    ;; bool _reached
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reached
       (if _reached (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reached
     (setq _reached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass tug_navigation_tools::rotational_movement
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::rotational_movement :md5sum-) "b8e92220d3a386937ac91ac3abd87983")
(setf (get tug_navigation_tools::rotational_movement :datatype-) "tug_navigation_tools/rotational_movement")
(setf (get tug_navigation_tools::rotational_movement :request) tug_navigation_tools::rotational_movementRequest)
(setf (get tug_navigation_tools::rotational_movement :response) tug_navigation_tools::rotational_movementResponse)

(defmethod tug_navigation_tools::rotational_movementRequest
  (:response () (instance tug_navigation_tools::rotational_movementResponse :init)))

(setf (get tug_navigation_tools::rotational_movementRequest :md5sum-) "b8e92220d3a386937ac91ac3abd87983")
(setf (get tug_navigation_tools::rotational_movementRequest :datatype-) "tug_navigation_tools/rotational_movementRequest")
(setf (get tug_navigation_tools::rotational_movementRequest :definition-)
      "float64 angle
---
bool reached

")

(setf (get tug_navigation_tools::rotational_movementResponse :md5sum-) "b8e92220d3a386937ac91ac3abd87983")
(setf (get tug_navigation_tools::rotational_movementResponse :datatype-) "tug_navigation_tools/rotational_movementResponse")
(setf (get tug_navigation_tools::rotational_movementResponse :definition-)
      "float64 angle
---
bool reached

")



(provide :tug_navigation_tools/rotational_movement "b8e92220d3a386937ac91ac3abd87983")


