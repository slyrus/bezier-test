
(asdf:defsystem #:bezier-test
  :depends-on (#:mcclim)
  :serial t
  :components
  ((:file "bezier-test")
   (:file "bezier-app")
   (:file "orientation-test")))
