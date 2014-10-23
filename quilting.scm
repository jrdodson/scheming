(require (lib "fungraph.ss" "concabs"))
(include "/quilting.scm")

;John Ryan Dodson
;usage: (quilt <pattern>)
; custom patterns: tri-bb, bridge-bb, and fox-bb
; requires libraries and scm file from Concrete Abstractions

(define tri-bb
  (overlay
   (overlay 
    (filled-triangle 0 -1 0 1 1 -1) 
    (mirror-image  (filled-triangle 0 -1 0 1 1 -1))
   )
   (overlay
    (filled-triangle 0 1 -1/2 1/2 -1/2 0)
    (mirror-image  (filled-triangle 0 1 -1/2 1/2 -1/2 0))
    )
   )
)
(define bridge-bb
  (overlay
   (overlay
    (filled-triangle 1 0 0 0 1 -1)
    (mirror-image  (filled-triangle 1 0 0 0 1 -1))
   )
   (overlay
    (filled-triangle 1/2 0 0 1/2 1/2 -1/2)
    (mirror-image  (filled-triangle 1/2 0 0 1/2 1/2 -1/2))
    )
   )
  )
(define fox-bb
  (overlay
   (filled-triangle 0 -1 1 1 -1 0)
   (mirror-image (filled-triangle 0 -1 1 1 -1 0))
   )
 )

(define quarter-turn-left
  (lambda (type)
    (quarter-turn-right
    (quarter-turn-right
    (quarter-turn-right type)))
    )
  )

(define half-turn
  (lambda (type)
    (quarter-turn-right
    (quarter-turn-right type))
    )
  )

(define side-by-side 
  (lambda (t1 t2)
    (quarter-turn-right
     (stack
        t1
        t2
     ))
    )
  )

(define pinwheel
  (lambda (n) 
   (stack
    (quarter-turn-right
     (stack
      (quarter-turn-right n)
      n
      ))
    (quarter-turn-right
     (stack
      (half-turn n)
      (quarter-turn-left n)
      ))
    )
  )
)

(define quilt
  (lambda(n)
    (stack
      (quarter-turn-right
       (stack (pinwheel n)
       (pinwheel n) )
       )
      (quarter-turn-right
       (stack (pinwheel n)
       (pinwheel n) )
       )
    )
 ))
    
