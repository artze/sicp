(define (abs x)
  (if
    (< x 0)
    (- x)
    x
  )
)

(define (sqrt-iter guess x)
  (define (improve g)
    (/ (+ g (/ x g)) 2)
  )
  ; (define (good-enough? g)
  ;   (< (abs (- (* g g) x)) 0.0001)
  ; )
  (define (good-enough? g)
    (<
      (/ 
        (abs (- g (improve g)))
        g
      )
      0.0001
    )
  )
  (if 
    (good-enough? guess)
    guess
    (sqrt-iter (improve guess) x)
  )
)

(print (sqrt-iter 1 0.00000012))