; Numbers that fool the Fermat test are called Carmichael numbers, and little is known
; about them other than that they are extremely rare. There are 255 Carmichael numbers
; below 100,000,000. The smallest few are 561, 1105, 1729, 2465, 2821, and 6601. 

; In testing primality of very large numbers chosen at random, the chance of stumbling 
; upon a value that fools the Fermat test is less than the chance that cosmic radiation
; will cause the computer to make an error in carrying out a ``correct'' algorithm.
; Considering an algorithm to be inadequate for the first reason but not for the second
; illustrates the difference between mathematics and engineering.

(define (even? x)
  (= (remainder x 2) 0)
)

(define (square x)
  (* x x)
)

(define (expmod base exp m)
  (cond
    ((= exp 0) 1)
    ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)

(define (fermat-test n)
  (define (is-prime? a)
    (= (expmod a n n) a)
  )
  (define (iter-test a)
    (cond
      ((= a (- n 1)) (print n " is prime"))
      ((not (is-prime? a)) (print n " is not prime") )
      (else (iter-test (+ a 1)))
    )
  )
  (iter-test 2)
)

(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)

; Results do indeed show that the above numbers fool the Fermat test, 
; i.e. results show that they are prime but they are really not