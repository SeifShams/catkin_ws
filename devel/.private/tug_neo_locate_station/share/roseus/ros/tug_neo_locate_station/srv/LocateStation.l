;; Auto-generated. Do not edit!


(when (boundp 'tug_neo_locate_station::LocateStation)
  (if (not (find-package "TUG_NEO_LOCATE_STATION"))
    (make-package "TUG_NEO_LOCATE_STATION"))
  (shadow 'LocateStation (find-package "TUG_NEO_LOCATE_STATION")))
(unless (find-package "TUG_NEO_LOCATE_STATION::LOCATESTATION")
  (make-package "TUG_NEO_LOCATE_STATION::LOCATESTATION"))
(unless (find-package "TUG_NEO_LOCATE_STATION::LOCATESTATIONREQUEST")
  (make-package "TUG_NEO_LOCATE_STATION::LOCATESTATIONREQUEST"))
(unless (find-package "TUG_NEO_LOCATE_STATION::LOCATESTATIONRESPONSE")
  (make-package "TUG_NEO_LOCATE_STATION::LOCATESTATIONRESPONSE"))

(in-package "ROS")





(defclass tug_neo_locate_station::LocateStationRequest
  :super ros::object
  :slots ())

(defmethod tug_neo_locate_station::LocateStationRequest
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

(defclass tug_neo_locate_station::LocateStationResponse
  :super ros::object
  :slots (_reached ))

(defmethod tug_neo_locate_station::LocateStationResponse
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

(defclass tug_neo_locate_station::LocateStation
  :super ros::object
  :slots ())

(setf (get tug_neo_locate_station::LocateStation :md5sum-) "80204a6ff2622a7071680d5597cbd3aa")
(setf (get tug_neo_locate_station::LocateStation :datatype-) "tug_neo_locate_station/LocateStation")
(setf (get tug_neo_locate_station::LocateStation :request) tug_neo_locate_station::LocateStationRequest)
(setf (get tug_neo_locate_station::LocateStation :response) tug_neo_locate_station::LocateStationResponse)

(defmethod tug_neo_locate_station::LocateStationRequest
  (:response () (instance tug_neo_locate_station::LocateStationResponse :init)))

(setf (get tug_neo_locate_station::LocateStationRequest :md5sum-) "80204a6ff2622a7071680d5597cbd3aa")
(setf (get tug_neo_locate_station::LocateStationRequest :datatype-) "tug_neo_locate_station/LocateStationRequest")
(setf (get tug_neo_locate_station::LocateStationRequest :definition-)
      "---

# returns whether position was reached successfully
bool reached

")

(setf (get tug_neo_locate_station::LocateStationResponse :md5sum-) "80204a6ff2622a7071680d5597cbd3aa")
(setf (get tug_neo_locate_station::LocateStationResponse :datatype-) "tug_neo_locate_station/LocateStationResponse")
(setf (get tug_neo_locate_station::LocateStationResponse :definition-)
      "---

# returns whether position was reached successfully
bool reached

")



(provide :tug_neo_locate_station/LocateStation "80204a6ff2622a7071680d5597cbd3aa")


