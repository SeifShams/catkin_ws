;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::translational_movement)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'translational_movement (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::TRANSLATIONAL_MOVEMENT")
  (make-package "TUG_NAVIGATION_TOOLS::TRANSLATIONAL_MOVEMENT"))
(unless (find-package "TUG_NAVIGATION_TOOLS::TRANSLATIONAL_MOVEMENTREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::TRANSLATIONAL_MOVEMENTREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::TRANSLATIONAL_MOVEMENTRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::TRANSLATIONAL_MOVEMENTRESPONSE"))

(in-package "ROS")





(defclass tug_navigation_tools::translational_movementRequest
  :super ros::object
  :slots (_back_and_forth _side_to_side ))

(defmethod tug_navigation_tools::translational_movementRequest
  (:init
   (&key
    ((:back_and_forth __back_and_forth) 0.0)
    ((:side_to_side __side_to_side) 0.0)
    )
   (send-super :init)
   (setq _back_and_forth (float __back_and_forth))
   (setq _side_to_side (float __side_to_side))
   self)
  (:back_and_forth
   (&optional __back_and_forth)
   (if __back_and_forth (setq _back_and_forth __back_and_forth)) _back_and_forth)
  (:side_to_side
   (&optional __side_to_side)
   (if __side_to_side (setq _side_to_side __side_to_side)) _side_to_side)
  (:serialization-length
   ()
   (+
    ;; float64 _back_and_forth
    8
    ;; float64 _side_to_side
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _back_and_forth
       (sys::poke _back_and_forth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _side_to_side
       (sys::poke _side_to_side (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _back_and_forth
     (setq _back_and_forth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _side_to_side
     (setq _side_to_side (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tug_navigation_tools::translational_movementResponse
  :super ros::object
  :slots (_reached ))

(defmethod tug_navigation_tools::translational_movementResponse
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

(defclass tug_navigation_tools::translational_movement
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::translational_movement :md5sum-) "0394d208a08b3715c1bf38023b0d4e4e")
(setf (get tug_navigation_tools::translational_movement :datatype-) "tug_navigation_tools/translational_movement")
(setf (get tug_navigation_tools::translational_movement :request) tug_navigation_tools::translational_movementRequest)
(setf (get tug_navigation_tools::translational_movement :response) tug_navigation_tools::translational_movementResponse)

(defmethod tug_navigation_tools::translational_movementRequest
  (:response () (instance tug_navigation_tools::translational_movementResponse :init)))

(setf (get tug_navigation_tools::translational_movementRequest :md5sum-) "0394d208a08b3715c1bf38023b0d4e4e")
(setf (get tug_navigation_tools::translational_movementRequest :datatype-) "tug_navigation_tools/translational_movementRequest")
(setf (get tug_navigation_tools::translational_movementRequest :definition-)
      "float64 back_and_forth
float64 side_to_side
---
bool reached

")

(setf (get tug_navigation_tools::translational_movementResponse :md5sum-) "0394d208a08b3715c1bf38023b0d4e4e")
(setf (get tug_navigation_tools::translational_movementResponse :datatype-) "tug_navigation_tools/translational_movementResponse")
(setf (get tug_navigation_tools::translational_movementResponse :definition-)
      "float64 back_and_forth
float64 side_to_side
---
bool reached

")



(provide :tug_navigation_tools/translational_movement "0394d208a08b3715c1bf38023b0d4e4e")


