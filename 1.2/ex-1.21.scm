(define (square x)
  (* x x)
)

(define (smallest-divisor n)
  (define (find-divisor n a)
    (cond
      ((> (square a) n) n)
      ((= (remainder n a) 0) a)
      (else (find-divisor n (+ a 1)))
    )
  )
  (find-divisor n 2)
)

(print (smallest-divisor 199))
(print (smallest-divisor 1999))
(print (smallest-divisor 19999))