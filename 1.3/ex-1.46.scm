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

; APPROACH 1
; This approach is less readable, and forces
; the improve procedure to be called at least 
; twice, i.e. in the first call, next already 
; consists of 2 improve calls
; 
; But it is interesting in that the improve
; procedure is 'accumulated' and called all
; at once at the end.

; (define (iterative-improve good-enough? improve)
;   (lambda (guess)
;     (define (iter i f)
;       (let
;         (
;           (
;             next ((compose improve f) guess)
;           )
;         )
;         (if (good-enough? (f guess) next)
;           next
;           (iter (+ i 1) (repeated improve i))
;         )
;       )
;     )
;     (iter 1 improve)
;   )
; )

; APPROACH 2
(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
        next
        (iter next)
      )
    )
  )
  (lambda (guess) (iter guess))
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
          0.00001
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
