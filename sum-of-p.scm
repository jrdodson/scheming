; John Ryan Dodson
;usage: (sum-of-power <number> <power>)
(define sum-of-power 
  (lambda(n p)
   (if (equal? 1 n)
      1
      (+ (expt n p) (sum-of-power (- n 1) p)))))
