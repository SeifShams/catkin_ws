;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::AccelerationStamped)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'AccelerationStamped (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::ACCELERATIONSTAMPED")
  (make-package "TUG_NAVIGATION_TOOLS::ACCELERATIONSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude AccelerationStamped.msg.html


(defclass tug_navigation_tools::AccelerationStamped
  :super ros::object
  :slots (_acceleration _time_steps _velocity ))

(defmethod tug_navigation_tools::AccelerationStamped
  (:init
   (&key
    ((:acceleration __acceleration) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time_steps __time_steps) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocity __velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _acceleration __acceleration)
   (setq _time_steps __time_steps)
   (setq _velocity __velocity)
   self)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:time_steps
   (&optional __time_steps)
   (if __time_steps (setq _time_steps __time_steps)) _time_steps)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; float64[] _acceleration
    (* 8    (length _acceleration)) 4
    ;; float64[] _time_steps
    (* 8    (length _time_steps)) 4
    ;; float64[] _velocity
    (* 8    (length _velocity)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _acceleration
     (write-long (length _acceleration) s)
     (dotimes (i (length _acceleration))
       (sys::poke (elt _acceleration i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _time_steps
     (write-long (length _time_steps) s)
     (dotimes (i (length _time_steps))
       (sys::poke (elt _time_steps i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocity
     (write-long (length _velocity) s)
     (dotimes (i (length _velocity))
       (sys::poke (elt _velocity i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _acceleration
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _acceleration (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _acceleration i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _time_steps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time_steps (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _time_steps i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocity (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocity i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get tug_navigation_tools::AccelerationStamped :md5sum-) "d18a36833bccd99a0ea7160cc1ef0909")
(setf (get tug_navigation_tools::AccelerationStamped :datatype-) "tug_navigation_tools/AccelerationStamped")
(setf (get tug_navigation_tools::AccelerationStamped :definition-)
      "float64[] acceleration
float64[] time_steps
float64[] velocity
")



(provide :tug_navigation_tools/AccelerationStamped "d18a36833bccd99a0ea7160cc1ef0909")


