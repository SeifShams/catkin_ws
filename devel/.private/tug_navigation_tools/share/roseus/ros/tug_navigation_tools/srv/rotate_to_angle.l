;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::rotate_to_angle)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'rotate_to_angle (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::ROTATE_TO_ANGLE")
  (make-package "TUG_NAVIGATION_TOOLS::ROTATE_TO_ANGLE"))
(unless (find-package "TUG_NAVIGATION_TOOLS::ROTATE_TO_ANGLEREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::ROTATE_TO_ANGLEREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::ROTATE_TO_ANGLERESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::ROTATE_TO_ANGLERESPONSE"))

(in-package "ROS")





(defclass tug_navigation_tools::rotate_to_angleRequest
  :super ros::object
  :slots (_desired_phi ))

(defmethod tug_navigation_tools::rotate_to_angleRequest
  (:init
   (&key
    ((:desired_phi __desired_phi) 0.0)
    )
   (send-super :init)
   (setq _desired_phi (float __desired_phi))
   self)
  (:desired_phi
   (&optional __desired_phi)
   (if __desired_phi (setq _desired_phi __desired_phi)) _desired_phi)
  (:serialization-length
   ()
   (+
    ;; float64 _desired_phi
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _desired_phi
       (sys::poke _desired_phi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _desired_phi
     (setq _desired_phi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tug_navigation_tools::rotate_to_angleResponse
  :super ros::object
  :slots (_reached ))

(defmethod tug_navigation_tools::rotate_to_angleResponse
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

(defclass tug_navigation_tools::rotate_to_angle
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::rotate_to_angle :md5sum-) "bd2782be2069801f5722cbaf3da80be1")
(setf (get tug_navigation_tools::rotate_to_angle :datatype-) "tug_navigation_tools/rotate_to_angle")
(setf (get tug_navigation_tools::rotate_to_angle :request) tug_navigation_tools::rotate_to_angleRequest)
(setf (get tug_navigation_tools::rotate_to_angle :response) tug_navigation_tools::rotate_to_angleResponse)

(defmethod tug_navigation_tools::rotate_to_angleRequest
  (:response () (instance tug_navigation_tools::rotate_to_angleResponse :init)))

(setf (get tug_navigation_tools::rotate_to_angleRequest :md5sum-) "bd2782be2069801f5722cbaf3da80be1")
(setf (get tug_navigation_tools::rotate_to_angleRequest :datatype-) "tug_navigation_tools/rotate_to_angleRequest")
(setf (get tug_navigation_tools::rotate_to_angleRequest :definition-)
      "float64 desired_phi
---
bool reached

")

(setf (get tug_navigation_tools::rotate_to_angleResponse :md5sum-) "bd2782be2069801f5722cbaf3da80be1")
(setf (get tug_navigation_tools::rotate_to_angleResponse :datatype-) "tug_navigation_tools/rotate_to_angleResponse")
(setf (get tug_navigation_tools::rotate_to_angleResponse :definition-)
      "float64 desired_phi
---
bool reached

")



(provide :tug_navigation_tools/rotate_to_angle "bd2782be2069801f5722cbaf3da80be1")


