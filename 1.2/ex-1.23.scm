(define (square x)
  (* x x)
)

; Scenario 1
; (define (smallest-divisor n)
;   (define (next x)
;     (if (= x 2)
;       3
;       (+ x 2)
;     )
;   )
;   (define (find-divisor n a)
;     (cond
;       ((> (square a) n) n)
;       ((= (remainder n a) 0) a)
;       (else (find-divisor n (next a)))
;     )
;   )
;   (find-divisor n 2)
; )

; Scenario 2
(define (smallest-divisor n)
  (define (find-divisor n a)
    (cond
      ((> (square a) n) n)
      ((= (remainder n a) 0) a)
      (else (find-divisor n (+ a 2)))
    )
  )
  (find-divisor n 3)
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

; Scenario 1
; (timed-prime-test 10000000000)
; (timed-prime-test 100000000000)
; (timed-prime-test 1000000000000)
; (timed-prime-test 10000000000000)
; (timed-prime-test 100000000000000)
; (timed-prime-test 1000000000000000)

; Scenario 2
(timed-prime-test 10000000000)
(timed-prime-test 100000000000)
(timed-prime-test 1000000000000)
(timed-prime-test 10000000000000)
(timed-prime-test 100000000000000)
(timed-prime-test 1000000000000000)


; ===== Analysis =====

; 1x10^x    millis  millis  millis    avg              Ratio to Prev.
; 10        31      31      29        30.3333333333   
; 11        98      85      85        89.3333333333     2.9450549451
; 12        268     266     260       264.6666666667    2.9626865672
; 13        821     823     817       820.3333333333    3.0994962217
; 14        2568    2553    2570      2563.6666666667   3.1251523771
; 15        8293    8227    8312      8277.3333333333   3.2287088805

; By skipping prime tests for a values that are even, the computation
; is about ~1.6 times faster than the implementation in ex-1.22. 

; This could be due to the following additional steps required in the
; 'improved' version:
; - Added function call 'next'
; - Added if evaluation

; We will test the hypothesis above by removing the 'next' function
; and simply using 3 as the starting point
; Comment/Uncomment the related block above to toggle between the
; 2 scenarios


; 1x10^x  millis  millis  millis    avg               Ratio to Prev    Num of times faster
; 10      22      23      23        22.6666666667                      2.01
; 11      69      74      70        71                 3.1323529412    1.93
; 12      207     219     206       210.6666666667     2.9671361502    1.97
; 13      646     652     640       646                3.0664556962    2.00
; 14      2045    2090    2086      2073.6666666667    3.2100103199    1.96
; 15      6568    6562    6575      6568.3333333333    3.1674971869    1.97


; The above results shows that it is indeed ~2 times faster than the 
; implementation in ex.1.22.