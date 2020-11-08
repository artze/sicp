; Ackermann's function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; Value of (A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
...
; There will be 9x (A 0 (A 0 ..)) nesting
(A 0 (A 0 (A 0 ... (A 1 1)))) 
(A 0 (A 0 (A 0 ... 2)))
(A 0 (A 0 (A 0 ... 4)))
; Answer: 2^10


; Value of (A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
...
(A 1 16)
(A 0 (A 1 15))
...
; There will be 15x (A 0 ...) nesting
(A 0 ... (A 1 1))
; Answer 2^16

; Value of (A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 (A 0 (A 1 1)))
(A 2 (A 0 2))
(A 2 4)
; Making use of (A 2 4) above
; Answer 2^16

; =======================================

; (define (f n) (A 0 n))
; f(n) = 2n

; (define (g n) (A 1 n))
; g(n) = 2^n

; (define (h n) (A 2 n))
; h(n) = 2^(h(n - 1))
