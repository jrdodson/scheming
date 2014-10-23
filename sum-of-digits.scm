; John Ryan Dodson
; usage: (sum-of-digits <digit>)
(define sum-of-digits
  (lambda(x) 
  (if (= x 0) 0 
      (+ (modulo x 10) 
         (sum-of-digits (/ (- x (modulo x 10)) 10))))))
