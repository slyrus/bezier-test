
(defpackage #:bezier-app
  (:use #:clim #:clim-lisp #:clim-extensions #:mcclim-bezier #:clim-shapes))

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
         (mcclim-bezier::make-bezier-thing*
          'mcclim-bezier:bezier-area
          (list 34 44 -100 128 347 124 247 256))))
    (draw-rectangle* pane 34 44 300 300 :ink +yellow+ :filled t)
    (mcclim-bezier:draw-bezier-design* pane design
                                       :line-thickness line-thickness
                                       :ink +blue+)))

(defun bezier-app-main ()
  (run-frame-top-level (make-application-frame 'bezier-app)))


(define-application-frame bezier-app-2 ()
  ()
  (:panes
   (app :application :height 400 :width 600
        :display-function 'display-bezier-2)
   (int :interactor :height 200 :width 600))
  (:layouts
   (default (vertically () app int))))

(defun display-bezier-2 (frame pane)
  (declare (ignore frame))
  (let ((line-thickness 4)
        (design
         (mcclim-bezier::make-bezier-thing*
          'mcclim-bezier:bezier-area
          (list 34 44 -100 128 347 124 247 256))))
    (formatting-table (pane :x-spacing 20
                                :y-spacing 20)
      (formatting-row (pane)
        (formatting-cell (pane :align-x :center
                               :align-y :center)
          (draw-rectangle* pane 34 44 300 300 :ink +green+ :filled t))
        (formatting-cell (pane :align-x :center
                               :align-y :center)
          (draw-rectangle* pane 34 44 300 300 :ink +yellow+ :filled t)
          (mcclim-bezier:draw-bezier-design* pane design
                                      :line-thickness line-thickness
                                      :ink +blue+))))))

(defun bezier-app-2-main ()
  (run-frame-top-level (make-application-frame 'bezier-app-2)))



(define-application-frame bezier-app-3 ()
  ()
  (:panes
   (app :application :height 400 :width 600
        :display-function 'display-bezier-3)
   (int :interactor :height 200 :width 600))
  (:layouts
   (default (vertically () app int))))


(defun display-bezier-3 (frame pane)
  (declare (ignore frame))
  (let ((line-thickness 4))
    (formatting-table (pane :x-spacing 20
                                :y-spacing 20)
      (formatting-row (pane)
        (formatting-cell (pane :align-x :center
                               :align-y :center))
        (draw-notched-rectangle* pane 260 50 60 60 30 :ink +green+)

        #+nil
        (let ((p3 (make-bezier-curve* (bezier-ellipsoid-4-coords 200 120 80 80 :x-stretch 0.05 :y-stretch 0.05))))
          (mcclim-bezier:draw-bezier-design* pane p3 :line-thickness line-thickness :ink +orange+))))))

(defun bezier-app-3-main ()
  (run-frame-top-level (make-application-frame 'bezier-app-3)))


(define-application-frame bezier-app-4 ()
  ()
  (:panes
   (app :application :height 400 :width 600
        :display-function 'display-bezier-4)
   (int :interactor :height 200 :width 600))
  (:layouts
   (default (vertically () app int))))


(defun display-bezier-4 (frame pane)
  (declare (ignore frame))
  (formatting-table (pane :x-spacing 20
                          :y-spacing 20)
    (formatting-row (pane)
      (formatting-cell (pane :align-x :center
                             :align-y :center))
      (clim-shapes::draw-grid pane)
      (clim-shapes::draw-notched-text-rectangle* pane "Bogus" 100 150 80 60 30 :ink +green+)

      #+nil
      (let ((p3 (make-bezier-curve* (bezier-ellipsoid-4-coords 200 120 80 80 :x-stretch 0.05 :y-stretch 0.05))))
        (mcclim-bezier:draw-bezier-design* pane p3 :line-thickness line-thickness :ink +orange+)))))

(defun bezier-app-4-main ()
  (run-frame-top-level (make-application-frame 'bezier-app-4)))

