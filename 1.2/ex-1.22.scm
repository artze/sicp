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

(define (even? x)
  (= (remainder x 2) 0)
)

(define (timed-prime-test n)
  (print "test primality from: " n)
  (if (even? n)
    (start-prime-test (+ n 1) (current-milliseconds) 3)
    (start-prime-test n (current-milliseconds) 3)
  )
)

(define (start-prime-test n start-time counter)
  (define (report-prime elapsed-time)
    (print "***")
    (print n " is prime")
    (print "elapsed-time: "elapsed-time)
    (start-prime-test (+ n 2) (current-milliseconds) (- counter 1))
  )
  (cond
    ((= counter 0) (print "found 3 primes"))
    ((is-prime? n) (report-prime (- (current-milliseconds) start-time)))
    (else (start-prime-test (+ n 2) (current-milliseconds) counter))
  )
)

(timed-prime-test 10000000000)
(timed-prime-test 100000000000)
(timed-prime-test 1000000000000)
(timed-prime-test 10000000000000)
(timed-prime-test 100000000000000)
(timed-prime-test 1000000000000000)

; Results
; 1x10^x    millis  millis  millis    avg                Ratio to prev.
; 10        45      47      45        45.6666666667 
; 11        136     139     135       136.6666666667     2.9927007299
; 12        406     419     420       415                3.0365853659
; 13        1293    1296    1288      1292.3333333333    3.1140562249
; 14        4078    4051    4054      4061               3.1423781274
; 15        12888   12863   13020     12923.6666666667   3.182385291

; 10^(1/2) = ~3.162

; Note: the timestamp in milliseconds is too small to provide an accurate
; reading for smaller number ranges. Numbers of at least 1x10^10 is used
; to get around this issue.