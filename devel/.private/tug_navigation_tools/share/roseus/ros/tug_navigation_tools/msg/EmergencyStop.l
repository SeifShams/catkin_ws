;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::EmergencyStop)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'EmergencyStop (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::EMERGENCYSTOP")
  (make-package "TUG_NAVIGATION_TOOLS::EMERGENCYSTOP"))

(in-package "ROS")
;;//! \htmlinclude EmergencyStop.msg.html


(defclass tug_navigation_tools::EmergencyStop
  :super ros::object
  :slots (_stop_cmd ))

(defmethod tug_navigation_tools::EmergencyStop
  (:init
   (&key
    ((:stop_cmd __stop_cmd) nil)
    )
   (send-super :init)
   (setq _stop_cmd __stop_cmd)
   self)
  (:stop_cmd
   (&optional (__stop_cmd :null))
   (if (not (eq __stop_cmd :null)) (setq _stop_cmd __stop_cmd)) _stop_cmd)
  (:serialization-length
   ()
   (+
    ;; bool _stop_cmd
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _stop_cmd
       (if _stop_cmd (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _stop_cmd
     (setq _stop_cmd (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get tug_navigation_tools::EmergencyStop :md5sum-) "a8c75689c02fa4ef8f26e5152b43ecdd")
(setf (get tug_navigation_tools::EmergencyStop :datatype-) "tug_navigation_tools/EmergencyStop")
(setf (get tug_navigation_tools::EmergencyStop :definition-)
      "bool stop_cmd

")



(provide :tug_navigation_tools/EmergencyStop "a8c75689c02fa4ef8f26e5152b43ecdd")


