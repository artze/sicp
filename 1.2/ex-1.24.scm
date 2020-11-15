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
  (if (fast-prime? n 4000)
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

; With order of growth of O(log n) we would expect the elapsed time
; to increase at a fixed amount with every increment of n in 1x10^n.

; Results below:
;             millis  millis  millis    avg               time increase
; 1x10^10     297     283     289       289.6666666667    
; 1x10^11     324     326     334       328               38.3333333333
; 1x10^12     338     341     365       348               20
; 1x10^13     385     364     380       376.3333333333    28.3333333333
; 1x10^14     403     393     406       400.6666666667    24.3333333333
; 1x10^15     411     436     426       424.3333333333    23.6666666667

; Results above shows that the time increase is roughly the same at each
; 10x increment. Also note that fast-prime? could be slower for smaller 
; primes compared to prime? implementation in (ex-1.23). The advantage of
; fast-prime? can be seen only for larger primes. See below:
; https://codology.net/post/sicp-solution-exercise-1-24/