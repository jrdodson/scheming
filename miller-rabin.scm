;John Ryan Dodson
;miller-rabin primality test for Introduction to Cryptography

(define check-req
  (lambda (a n)
    (if (and
         (not(or (= a 1) (= a (- n 1))))
         (= (remainder (* a a) n) 1)
         )
        0
        (remainder (* a a) n)
    )
  )
)

;self-explanatory helper function
(define iseven?
  (lambda (n)
  (= (remainder n 2) 0)
    )
  )

;powermod function that takes a base, an exponent and an n
(define powermod 
  (lambda (base exp n)
    (cond ((= exp 0) 1)
        ((iseven? exp)
          (check-req (powermod base (/ exp 2) n) n))
        (else
          (remainder (* base (powermod base (- exp 1) n))
                     n))
     )
    )
  )

;finally do real stuff
(define do-test 
  (lambda (n a)
    (= (powermod a (- n 1) n) 1)
    )
  )

;picks a random a and starts the test
;if counter is less than or equal to 1, do-test one last time
;otherwise, if the test returns true, start again but decrement counter
;else return false because we are composite
; we define a = (+ 2(random (- n 2)))
(define start-test
  (lambda (n i)
    (if (<= i 1) 
        (do-test n (+ 2(random (- n 2))))
        (cond (equal? (and (do-test n (+ 2(random (- n 2)))) #t) (start-test n (- i 1)))
              (else #f)
              )
        )
  )
)

;usage: (miller-rabin <number>)
;Warning: currently cannot fail with strong pseudoprimes like 1105
;we start start-test with our number and a counter
(define miller-rabin 
  (lambda(n)
   (cond ((<= n 2) (print "Number too small"))
         ((> n 4294967087) (print "Number too large"))
    (else 
     (if (equal? (start-test n 4) #f) 
         (print "Composite")
         (print "Probably prime")         
         )
        )
      )
    )
  )
 
