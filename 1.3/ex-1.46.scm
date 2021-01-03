; repeat procedure
(define (compose f g)
  (lambda (x)
    (f (g x))
  )
)

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))
  )
)

; iterative-improve procedure
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter i f)
      (let
        (
          (
            next ((compose improve f) guess)
          )
        )
        (if (good-enough? (f guess) next)
          next
          (iter (+ i 1) (repeated f i))
        )
      )
    )
    (iter 1 improve)
  )
)

; square-root procedure
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))

(define (square-root x guess)
  (
    (iterative-improve
      (lambda (y z)
        (<
          (/
            (abs (- y z))
            y
          )
          0.0001
        )
      )
      (lambda (y) (average y (/ x y)))
    )
    guess
  )
)
; As a test, the following should return
; 1.73205080756888
(print (square-root 3 1))

; fixed-point procedure
(define (fixed-point f guess)
  (
    (iterative-improve
      (lambda (y z)
        (< (abs (- y z)) 0.00001)
      )
      f
    )
    guess
  )
)

; As a test, the following should return 
; 1.25873159629712
(print (fixed-point (lambda (y) (+ (sin y) (cos y))) 1))
