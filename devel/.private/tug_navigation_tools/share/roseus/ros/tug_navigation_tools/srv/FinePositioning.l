;; Auto-generated. Do not edit!


(when (boundp 'tug_navigation_tools::FinePositioning)
  (if (not (find-package "TUG_NAVIGATION_TOOLS"))
    (make-package "TUG_NAVIGATION_TOOLS"))
  (shadow 'FinePositioning (find-package "TUG_NAVIGATION_TOOLS")))
(unless (find-package "TUG_NAVIGATION_TOOLS::FINEPOSITIONING")
  (make-package "TUG_NAVIGATION_TOOLS::FINEPOSITIONING"))
(unless (find-package "TUG_NAVIGATION_TOOLS::FINEPOSITIONINGREQUEST")
  (make-package "TUG_NAVIGATION_TOOLS::FINEPOSITIONINGREQUEST"))
(unless (find-package "TUG_NAVIGATION_TOOLS::FINEPOSITIONINGRESPONSE")
  (make-package "TUG_NAVIGATION_TOOLS::FINEPOSITIONINGRESPONSE"))

(in-package "ROS")





(defclass tug_navigation_tools::FinePositioningRequest
  :super ros::object
  :slots (_wall_position _goal_distance _initial_distance ))

(defmethod tug_navigation_tools::FinePositioningRequest
  (:init
   (&key
    ((:wall_position __wall_position) 0)
    ((:goal_distance __goal_distance) 0.0)
    ((:initial_distance __initial_distance) 0.0)
    )
   (send-super :init)
   (setq _wall_position (round __wall_position))
   (setq _goal_distance (float __goal_distance))
   (setq _initial_distance (float __initial_distance))
   self)
  (:wall_position
   (&optional __wall_position)
   (if __wall_position (setq _wall_position __wall_position)) _wall_position)
  (:goal_distance
   (&optional __goal_distance)
   (if __goal_distance (setq _goal_distance __goal_distance)) _goal_distance)
  (:initial_distance
   (&optional __initial_distance)
   (if __initial_distance (setq _initial_distance __initial_distance)) _initial_distance)
  (:serialization-length
   ()
   (+
    ;; int64 _wall_position
    8
    ;; float64 _goal_distance
    8
    ;; float64 _initial_distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _wall_position
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _wall_position (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _wall_position) (= (length (_wall_position . bv)) 2)) ;; bignum
              (write-long (ash (elt (_wall_position . bv) 0) 0) s)
              (write-long (ash (elt (_wall_position . bv) 1) -1) s))
             ((and (class _wall_position) (= (length (_wall_position . bv)) 1)) ;; big1
              (write-long (elt (_wall_position . bv) 0) s)
              (write-long (if (>= _wall_position 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _wall_position s)(write-long (if (>= _wall_position 0) 0 #xffffffff) s)))
     ;; float64 _goal_distance
       (sys::poke _goal_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _initial_distance
       (sys::poke _initial_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _wall_position
#+(or :alpha :irix6 :x86_64)
      (setf _wall_position (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _wall_position (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _goal_distance
     (setq _goal_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _initial_distance
     (setq _initial_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass tug_navigation_tools::FinePositioningResponse
  :super ros::object
  :slots (_reached ))

(defmethod tug_navigation_tools::FinePositioningResponse
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

(defclass tug_navigation_tools::FinePositioning
  :super ros::object
  :slots ())

(setf (get tug_navigation_tools::FinePositioning :md5sum-) "171c107e3dd8cdfa8ae691b15d06b1d1")
(setf (get tug_navigation_tools::FinePositioning :datatype-) "tug_navigation_tools/FinePositioning")
(setf (get tug_navigation_tools::FinePositioning :request) tug_navigation_tools::FinePositioningRequest)
(setf (get tug_navigation_tools::FinePositioning :response) tug_navigation_tools::FinePositioningResponse)

(defmethod tug_navigation_tools::FinePositioningRequest
  (:response () (instance tug_navigation_tools::FinePositioningResponse :init)))

(setf (get tug_navigation_tools::FinePositioningRequest :md5sum-) "171c107e3dd8cdfa8ae691b15d06b1d1")
(setf (get tug_navigation_tools::FinePositioningRequest :datatype-) "tug_navigation_tools/FinePositioningRequest")
(setf (get tug_navigation_tools::FinePositioningRequest :definition-)
      "# indicator on which side of the Eisenschwein the wall is positioned: 1 = starboard; -1 = port 
int64 wall_position

# distance between border of table and Eisenschwein
float64 goal_distance
float64 initial_distance

---

# returns whether position was reached successfully
bool reached

")

(setf (get tug_navigation_tools::FinePositioningResponse :md5sum-) "171c107e3dd8cdfa8ae691b15d06b1d1")
(setf (get tug_navigation_tools::FinePositioningResponse :datatype-) "tug_navigation_tools/FinePositioningResponse")
(setf (get tug_navigation_tools::FinePositioningResponse :definition-)
      "# indicator on which side of the Eisenschwein the wall is positioned: 1 = starboard; -1 = port 
int64 wall_position

# distance between border of table and Eisenschwein
float64 goal_distance
float64 initial_distance

---

# returns whether position was reached successfully
bool reached

")



(provide :tug_navigation_tools/FinePositioning "171c107e3dd8cdfa8ae691b15d06b1d1")


