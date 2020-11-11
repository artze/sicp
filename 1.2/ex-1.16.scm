(define (even? x) 
  (= (remainder  x 2) 0)
)

(define (square x)
  (* x x)
)

; Recursive algorithm for fast-expt

(define (fast-expt b n)
  (cond
    ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))
  )
)

(print (fast-expt 5 6))

; Iterative algorithm for fast-expt

(define (fast-expt-iter b n)
  (define (iter b n acc)
    (cond
      ((= n 0) acc)
      ((even? n) (iter (square b) (/ n 2) acc))
      (else (iter b (- n 1) (* acc b)))
    )
  )
  (iter b n 1)
)

(print (fast-expt-iter 5 6))