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

(define (is-prime? x)
  (= (smallest-divisor x) x)
)

(define (timed-prime-test n)
  (print "test primality from: " n)
  (start-prime-test n (current-milliseconds) 3)
)

(define (start-prime-test n start-time counter)
  (define (report-prime elapsed-time)
    (print "***")
    (print n " is prime")
    (print "elapsed-time: "elapsed-time)
    (start-prime-test (+ n 2) start-time (- counter 1))
  )
  (cond
    ((= counter 0) (print "found 3 primes"))
    ((is-prime? n) (report-prime (- (current-milliseconds) start-time)))
    (else (start-prime-test (+ n 2) start-time counter))
  )
)

(timed-prime-test 1001)
(timed-prime-test 10001)
(timed-prime-test 100001)
(timed-prime-test 1000001)
(timed-prime-test 10000001)
(timed-prime-test 100000001)
(timed-prime-test 1000000001)
