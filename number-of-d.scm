; John Ryan Dodson
;usage: (number-of-d <digits> <d>)
;make sure n > 0
;recurse with the quotient of n and 10 and decide whether to increment the counter. 
(define count-d
  (lambda(n i d)
    (cond ((equal? (remainder n 10) 0) i)
          (else (count-d (quotient n 10) (if (equal? (remainder n 10) d)
                                              (+ i 1)
                                              i
                                              ) d)))))
    
(define number-of-d
  (lambda (n d)
    (count-d n 0 d)))
    
