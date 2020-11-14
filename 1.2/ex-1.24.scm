(require-extension numbers)

; === Fermat Test ===
(define (even? x)
  (= (remainder x 2) 0)
)

(define (square x)
  (* x x)
)

(define (expmod base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp)
      (remainder (square (expmod base (/ exp 2) m)) m)
    )
    (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a)
  )
  (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
  (cond
    ((= times 0) #t)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else #f)
  )
)

; === Timed Prime Test ===
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (print "Test primality for: " n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 2000)
    (report-prime (- (runtime) start-time))
    (print "not prime")
  )
)

(define (report-prime elapsed-time)
  (print "***")
  (print "elapsed time: " elapsed-time))

(print "=====1x10^10=====")
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)

(print "=====1x10^11=====")
(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)

(print "=====1x10^12=====")
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)

(print "=====1x10^13=====")
(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099)

(print "=====1x10^14=====")
(timed-prime-test 100000000000031)
(timed-prime-test 100000000000067)
(timed-prime-test 100000000000097)

(print "=====1x10^15=====")
(timed-prime-test 1000000000000037)
(timed-prime-test 1000000000000091)
(timed-prime-test 1000000000000159)