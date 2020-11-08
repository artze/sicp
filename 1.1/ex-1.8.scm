(define (abs x)
  (if
    (< x 0)
    (- x)
    x
  )
)

(define (cube x)
  (* x x x)
)

(define (cbrt-iter guess x)
  (define (good-enough? g)
    (< 
      (abs (- (cube g) x))
      0.001
    )
  )
  (define (improve g)
    (/
      (+ (/ x (* g g)) (* 2 g))
      3
    )
  )
  (if
    (good-enough? guess)
    guess
    (cbrt-iter (improve guess) x)
  )
)

(print (cbrt-iter 1 30))