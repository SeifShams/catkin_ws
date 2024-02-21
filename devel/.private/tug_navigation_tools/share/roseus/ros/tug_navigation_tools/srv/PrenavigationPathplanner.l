;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::PrenavigationPathplanner)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'PrenavigationPathplanner (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::PRENAVIGATIONPATHPLANNER")
  (make-package "TUG_NAVIGATION_TOOLS::PRENAVIGATIONPATHPLANNER"))
(unless (find-package "TUG_NAVIGATION_TOOLS::PRENAVIGATIONPATHPLANNERREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::PRENAVIGATIONPATHPLANNERREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::PRENAVIGATIONPATHPLANNERRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::PRENAVIGATIONPATHPLANNERRESPONSE"))

(in-package "ROS")





(defclass tug_navigation_tools::PrenavigationPathplannerRequest
  :super ros::object
  :slots ())

(defmethod tug_navigation_tools::PrenavigationPathplannerRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass tug_navigation_tools::PrenavigationPathplannerResponse
  :super ros::object
  :slots (_reached ))

(defmethod tug_navigation_tools::PrenavigationPathplannerResponse
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

(defclass tug_navigation_tools::PrenavigationPathplanner
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::PrenavigationPathplanner :md5sum-) "80204a6ff2622a7071680d5597cbd3aa")
(setf (get tug_navigation_tools::PrenavigationPathplanner :datatype-) "tug_navigation_tools/PrenavigationPathplanner")
(setf (get tug_navigation_tools::PrenavigationPathplanner :request) tug_navigation_tools::PrenavigationPathplannerRequest)
(setf (get tug_navigation_tools::PrenavigationPathplanner :response) tug_navigation_tools::PrenavigationPathplannerResponse)

(defmethod tug_navigation_tools::PrenavigationPathplannerRequest
  (:response () (instance tug_navigation_tools::PrenavigationPathplannerResponse :init)))

(setf (get tug_navigation_tools::PrenavigationPathplannerRequest :md5sum-) "80204a6ff2622a7071680d5597cbd3aa")
(setf (get tug_navigation_tools::PrenavigationPathplannerRequest :datatype-) "tug_navigation_tools/PrenavigationPathplannerRequest")
(setf (get tug_navigation_tools::PrenavigationPathplannerRequest :definition-)
      "#nav_msgs/Path path
---
bool reached

")

(setf (get tug_navigation_tools::PrenavigationPathplannerResponse :md5sum-) "80204a6ff2622a7071680d5597cbd3aa")
(setf (get tug_navigation_tools::PrenavigationPathplannerResponse :datatype-) "tug_navigation_tools/PrenavigationPathplannerResponse")
(setf (get tug_navigation_tools::PrenavigationPathplannerResponse :definition-)
      "#nav_msgs/Path path
---
bool reached

")



(provide :tug_navigation_tools/PrenavigationPathplanner "80204a6ff2622a7071680d5597cbd3aa")


