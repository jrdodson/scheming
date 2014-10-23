(require (lib "fungraph.ss" "concabs"))
;John Ryan Dodson
;requires libraries from Concrete Abstractions
;usage (box-curve x0 y0 x1 y1 level) or (flower-curve)
;eg. (box-curve 0 -1/2 0 1/2 6) 

;to be used later for negation
(define negate
  (lambda (n)
    (- 0 n)))

;original c-curve found in the text
(define c-curve
  (lambda (x0 y0 x1 y1 level)
    (if (= level 0)
        (line x0 y0 x1 y1)
        (let ((xmid (/ (+ x0 x1) 2))
              (ymid (/ (+ y0 y1) 2))
              (dx (- x1 x0))
              (dy (- y1 y0)))
          (let ((xa (- xmid (/ dy 2)))
                (ya (+ ymid (/ dx 2))))
            (overlay (c-curve x0 y0 xa ya (- level 1))
                     (c-curve xa ya x1 y1 (- level 1))))))))

;box-curve
(define box-curve
  (lambda (x0 y0 x1 y1 level)
    (if (= level 0)
        (line x0 y0 x1 y1)
        (let ((xmid (/ (+ x0 x1) 2))
              (ymid (/ (+ y0 y1) 2))
              (dx (- x1 x0))
              (dy (- y1 y0)))
          (let ((xa (+ xmid (/ dy 2)))
                (ya (+ ymid (/ dx 2))))         
             (overlay
              (overlay
               (box-curve x0 y0 xa ya (- level 1))
               (box-curve xa ya x1 y1 (- level 1)))
              (overlay
               (c-curve (negate xa) (negate ya) (negate x1) (negate y1) (- level 1))
               (c-curve (negate x0) (negate y0) (negate xa) (negate ya) (- level 1)))))))))

; this will take a few seconds
(define flower-curve
  (lambda ()
    (quarter-turn-right
     (box-curve  0 -1/2 0 1/2 10))))
