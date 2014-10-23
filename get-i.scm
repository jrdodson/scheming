; John Ryan Dodson
; usage: (get-i <number>
(define get-i
  (lambda (n)
    (if (odd? n)
        0
        (add1 (get-i (/ n 2))))))
