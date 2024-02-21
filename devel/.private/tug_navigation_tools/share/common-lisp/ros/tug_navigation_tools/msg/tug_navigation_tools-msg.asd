
(cl:in-package :asdf)

(defsystem "tug_navigation_tools-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AccelerationStamped" :depends-on ("_package_AccelerationStamped"))
    (:file "_package_AccelerationStamped" :depends-on ("_package"))
    (:file "EmergencyStop" :depends-on ("_package_EmergencyStop"))
    (:file "_package_EmergencyStop" :depends-on ("_package"))
  ))