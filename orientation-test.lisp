(defpackage #:orientation-test
  (:use #:clim #:clim-lisp #:clim-extensions))

(in-package #:orientation-test)

(defun orientation-test (&key (file #p"orientation-figure.ps")
                         (orientation :portrait))
  (format t ";; Creating ~S.~%" file)
  (with-open-file (file-stream file :direction :output :if-exists :supersede)
    (with-output-to-postscript-stream
        (stream file-stream
                :header-comments '(:title "Foo")
                :scale-to-fit t
                :orientation orientation)
        (formatting-table (stream :x-spacing 20
                                  :y-spacing 20)
          (formatting-row (stream)
            (formatting-cell (stream :align-x :center
                                     :align-y :bottom
                                     :min-height 110)
              (draw-text* stream "Orientation Test" 170 30
                          :text-style (make-text-style :fix :bold :normal))))
          (formatting-row (stream)
            (formatting-cell (stream :align-x :left
                                     :align-y :center)
              (let ((line-thickness 4))
                (draw-circle* stream 30 30 20
                              :filled nil
                              :line-thickness line-thickness
                              :ink +brown+)
                (draw-rectangle* stream 20 20 200 90
                              :filled nil
                              :line-thickness line-thickness
                              :ink +sea-green+)))
            (formatting-cell (stream :align-x :left
                                     :align-y :center)
              (draw-text* stream "Some more text!" 20 20
                          :text-style (make-text-style :fix :bold :normal)))))))
  file)

(uiop:run-program `("ps2pdf"
                    ,(uiop:unix-namestring
                      (orientation-test :file "orientation-figure-portrait.ps"))))

(uiop:run-program `("ps2pdf"
                    ,(uiop:unix-namestring
                      (orientation-test :file "orientation-figure-landscape.ps"
                                        :orientation :landscape))))
