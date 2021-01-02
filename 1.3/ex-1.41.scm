(define (double f)
  (lambda (x)
    (f (f x))
  )
)

(define (inc x) (+ x 1))

(print
  (
    (
      (double (double double))
      inc
    )
  5)
)

; The following is equivalent to above
(print
  ((double (double (double (double inc)))) 5))