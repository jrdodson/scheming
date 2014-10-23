(require (lib "fungraph.ss" "concabs"))
; John Ryan Dodson
; requires libraries from Concrete Abstractions
; usage: (draw-gasket <level>)
; or (gasket <some coords> <level>) if anyone wants to do a custom gasket

(define gasket
  (lambda (x0 y0 x1 y1 x2 y2 level)
    (if (= level 0)
        (filled-triangle x0 y0 x1 y1 x2 y2)
        (let ((xa (/ (+ x0 x1) 2))
              (ya (/ (+ y0 y1) 2))
              (xb (/ (+ x1 x2) 2))
              (yb (/ (+ y1 y2) 2))
              (xc (/ (+ x0 x2) 2))
              (yc (/ (+ y0 y2) 2)))
          (overlay (gasket xa ya x1 y1 xb yb (- level 1))
                   (overlay (gasket x0 y0 xa ya xc yc (- level 1))
                            (gasket xc yc xb yb x2 y2 (- level 1))))))))

(define draw-gasket
  (lambda (level)
    (gasket 0 1 -1 -1 1 -1 level)))
