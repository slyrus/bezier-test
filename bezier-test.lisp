
(defpackage #:bezier-test
  (:use #:clim #:clim-lisp #:clim-extensions))

(in-package #:bezier-test)

(defun bezier-test-1 (&key (file #p"bezier-figure-1.ps"))
  (format t ";; Creating ~S.~%" file)
  (with-open-file (file-stream file :direction :output :if-exists :supersede)
    (with-output-to-postscript-stream
        (stream file-stream
                :header-comments '(:title "Foo")
                :scale-to-fit t)
      (formatting-table (stream :x-spacing 20
                                :y-spacing 20)
        (formatting-row (stream)
          (formatting-cell (stream :align-x :left
                                   :align-y :center)
            (let ((line-thickness 4))
              (draw-circle* stream 30 30 20
                            :start-angle (/ pi 2)
                            :end-angle (+ (/ pi 2) pi)
                            :filled nil
                            :line-thickness line-thickness)
              (draw-circle* stream 60 30 20
                            :start-angle (+ (/ pi 2) pi)
                            :end-angle (/ pi 2)
                            :filled nil
                            :line-thickness line-thickness)
              (draw-rectangle* stream 0 0 10 10 :ink +green+)
              (draw-rectangle* stream 3 3 13 13 :ink +red+)
              (draw-rectangle* stream 34 44 247 256 :ink +yellow+)
              (draw-polygon* stream '(10 200 50 120 120 200) :ink +blue+)
              (let ((design
                     (mcclim-bezier:make-bezier-area*
                      (list 34 44 34 128 147 44 247 256 34 128 50 50 34 44))))
                (mcclim-bezier:draw-bezier-design* stream design
                                            :line-thickness line-thickness
                                            :ink +sea-green+))))))))
  file)

(uiop:run-program `("ps2pdf" ,(uiop:unix-namestring (bezier-test-1))))

(defun bezier-test-2 (&key (file #p"bezier-figure-2.ps"))
  (format t ";; Creating ~S.~%" file)
  (with-open-file (file-stream file :direction :output :if-exists :supersede)
    (with-output-to-postscript-stream
        (stream file-stream
                :header-comments '(:title "Foo")
                :scale-to-fit t)
      (formatting-table (stream :x-spacing 20
                                :y-spacing 20)

        (formatting-row (stream)
          (formatting-cell (stream :align-x :center
                                   :align-y :bottom
                                   :min-height 110)
            (draw-text* stream "Bezier Test" 170 30
                        :text-style (make-text-style :fix :bold :normal))))
        (formatting-row (stream)
          (formatting-cell (stream :align-x :left
                                   :align-y :center)
            (let ((line-thickness 4))
              (draw-circle* stream 30 30 20
                            :start-angle (/ pi 2)
                            :end-angle (+ (/ pi 2) pi)
                            :filled nil
                            :line-thickness line-thickness)

              (draw-circle* stream 60 30 20
                            :start-angle (+ (/ pi 2) pi)
                            :end-angle (/ pi 2)
                            :filled nil
                            :line-thickness line-thickness)
              (let ((design
                     (mcclim-bezier:make-bezier-area*
                      (list 34 44 34 128 147 44 247 256 34 128 50 50 34 44))))
                (draw-rectangle* stream 0 0 10 10 :ink +green+)
                (draw-rectangle* stream 3 3 13 13 :ink +red+)
                (draw-rectangle* stream 34 44 247 256 :ink +yellow+)
                (draw-polygon* stream '(10 200 50 120 120 200) :ink +blue+)
                (mcclim-bezier:draw-bezier-design* stream design
                                            :line-thickness line-thickness
                                            :ink +black+))))
          (formatting-cell (stream :align-x :left
                                   :align-y :center)
            (let ((line-thickness 4))
              (draw-circle* stream 30 30 20
                            :start-angle (/ pi 2)
                            :end-angle (+ (/ pi 2) pi)
                            :filled nil
                            :line-thickness line-thickness)

              (draw-circle* stream 60 30 20
                            :start-angle (+ (/ pi 2) pi)
                            :end-angle (/ pi 2)
                            :filled nil
                            :line-thickness line-thickness)
              (let ((design
                     (mcclim-bezier:make-bezier-area*
                      (list 34 44 34 128 147 44 247 256 34 128 50 50 34 44))))
                (draw-rectangle* stream 0 0 10 10 :ink +green+)
                (draw-rectangle* stream 3 3 13 13 :ink +red+)
                (draw-rectangle* stream 34 44 247 256 :ink +pink+)
                (draw-polygon* stream '(10 200 50 120 120 200) :ink +blue+)
                (mcclim-bezier:draw-bezier-design* stream design
                                            :line-thickness line-thickness
                                            :ink +sea-green+))))))))
  file)

(uiop:run-program `("ps2pdf" ,(uiop:unix-namestring (bezier-test-2))))


