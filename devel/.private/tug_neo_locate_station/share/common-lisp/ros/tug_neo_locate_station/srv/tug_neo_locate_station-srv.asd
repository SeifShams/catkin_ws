
(cl:in-package :asdf)

(defsystem "tug_neo_locate_station-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LocateStation" :depends-on ("_package_LocateStation"))
    (:file "_package_LocateStation" :depends-on ("_package"))
  ))