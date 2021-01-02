(define (compose f g)
  (lambda (x)
    (f (g x))
  )
)

; Iterative Solution 
; (define (repeated f n)
;   (define (compose-iter g i)
;     (if (= i 0)
;       g
;       (compose-iter (compose f g) (- i 1))
;     )
;   )
;   (compose-iter identity n)
; )

; Recursive Solution
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))
  )
)

; Check answer
(define (square x) (* x x))
(define (inc x) (+ x 1))

; Should return 625
(print
  ((repeated square 2) 5)
)

; Should return 20
(print
  ((repeated inc 10) 10)
)