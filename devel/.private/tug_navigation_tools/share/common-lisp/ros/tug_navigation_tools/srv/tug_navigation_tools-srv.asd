
(cl:in-package :asdf)

(defsystem "tug_navigation_tools-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :nav_msgs-msg
)
  :components ((:file "_package")
    (:file "FinePositioning" :depends-on ("_package_FinePositioning"))
    (:file "_package_FinePositioning" :depends-on ("_package"))
    (:file "PrenavigationPathplanner" :depends-on ("_package_PrenavigationPathplanner"))
    (:file "_package_PrenavigationPathplanner" :depends-on ("_package"))
    (:file "calculate_rotation" :depends-on ("_package_calculate_rotation"))
    (:file "_package_calculate_rotation" :depends-on ("_package"))
    (:file "parking_position" :depends-on ("_package_parking_position"))
    (:file "_package_parking_position" :depends-on ("_package"))
    (:file "rotate_to_angle" :depends-on ("_package_rotate_to_angle"))
    (:file "_package_rotate_to_angle" :depends-on ("_package"))
    (:file "rotational_movement" :depends-on ("_package_rotational_movement"))
    (:file "_package_rotational_movement" :depends-on ("_package"))
    (:file "trajectory" :depends-on ("_package_trajectory"))
    (:file "_package_trajectory" :depends-on ("_package"))
    (:file "translational_movement" :depends-on ("_package_translational_movement"))
    (:file "_package_translational_movement" :depends-on ("_package"))
  ))