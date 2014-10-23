; John Ryan Dodson
;usage: (number-of-odds <digits>)

;this will convert the number to a list of individual digits
(define (num-to-list n)
  (if (< n 10)
      (list n)
      (append (num-to-list (floor (/ n 10)))
              (list (- n (* 10 (floor (/ n 10))))))))

;convert digit input to a list...
;and then filter out all the odds :)
(define number-of-odds
  (lambda(n)
    (length (filter odd? (num-to-list n)))))
