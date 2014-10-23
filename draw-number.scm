; John Ryan Dodson
; requires libraries from Concrete Abstractions

(require (lib "fungraph.ss" "concabs"))
(include "/quilting.scm")
(load "/digits.scm")

(define draw
  (lambda (i)
    (cond ((equal? i 1) one-bb)
          ((equal? i 2) two-bb)
          ((equal? i 3) three-bb)
          ((equal? i 4) four-bb)
          ((equal? i 5) five-bb)
          ((equal? i 6) six-bb)
          ((equal? i 7) seven-bb)
          ((equal? i 8) eight-bb)
          ((equal? i 9) nine-bb)
          ((equal? i 0) zero-bb)
          (else 0))))

(define to-list
  (lambda (n) 
    (if (zero? n) `()
        (append (to-list (quotient n 10)) (list (remainder n 10))))))

;usage: (draw-number <number>)
;just coverts your digit to a list of numbers and iterates over that list
(define draw-number 
  (lambda (n)
    (define input (to-list n))
    (map (lambda (i) (draw i)) input)))
    
