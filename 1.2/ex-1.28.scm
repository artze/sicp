(define (square x)
  (* x x)
)

(define (expmod base exp m)
  (define (square-check x)
    (if
      (and
        (not (or (= x 1) (= x (- m 1))))
        (= (remainder (square x) m) 1)
      )
      0
      (remainder (square x) m)
    )
  )

  (cond
    ((= exp 0) 1)
    ((even? exp) (square-check (expmod base (/ exp 2) m)))
    (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)

(define (miller-rabin-test n)
  (define (try-it a)
    (if
      (= (expmod a (- n 1) n) 1)
      (print n " is prime")
      (print n " is not prime")
    )
  )

  (try-it (+ (random (- n 1)) 1))
)

(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)

(miller-rabin-test 13)
(miller-rabin-test 29)
(miller-rabin-test 17)
(miller-rabin-test 23)