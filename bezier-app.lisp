
(defpackage #:bezier-app
  (:use #:clim #:clim-lisp #:clim-extensions))

(in-package #:bezier-app)

(in-package :bezier-app)

(define-application-frame bezier-app ()
  ()
  (:panes
   (app :application :height 400 :width 600
        :display-function 'display-bezier)
   (int :interactor :height 200 :width 600))
  (:layouts
   (default (vertically () app int))))

(defun display-bezier (frame pane)
  (declare (ignore frame))
  (let ((line-thickness 4)
        (design
         (climi::make-bezier-thing*
          'climi::bezier-area
          (list 34 44 -100 128 347 124 247 256))))
    (draw-rectangle* pane 34 44 300 300 :ink +yellow+ :filled t)
    (climi::draw-bezier-design* pane design
                                :line-thickness line-thickness
                                :ink +blue+)))

(defun bezier-app-main ()
  (run-frame-top-level (make-application-frame 'bezier-app)))
