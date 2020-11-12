(define (double x)
  (+ x x)
)

(define (half x)
  (/ x 2)
)

(define (even? x)
  (= (remainder x 2) 0)
)

; Iterative algorithm
(define (fast-mult-iter b n)
  (define (iter b n a)
    (cond
      ((= n 0) a)
      ((even? n) (iter (double b) (half n) a))
      (else (iter b (- n 1) (+ a b)))
    )
  )

  (iter b n 0)
)

(print (fast-mult-iter 8 7))