(define (double x)
  (+ x x)
)

(define (half x)
  (/ x 2)
)

(define (even? x)
  (= (remainder x 2) 0)
)

; Recursive algorithm
(define (fast-mult-recur b n)
  (cond
    ((= n 0) 0)
    ((even? n) (double (fast-mult-recur b (half n))))
    (else (+ b (fast-mult-recur b (- n 1))))
  )
)

(print (fast-mult-recur 8 7))
