
(asdf:defsystem #:bezier-test
  :depends-on (#:mcclim #:mcclim-bezier #:clim-shapes)
  :serial t
  :components
  ((:file "bezier-test")
   (:file "bezier-app")
   (:file "orientation-test")))
