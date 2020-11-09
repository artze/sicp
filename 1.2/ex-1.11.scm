; recursive solution

(define (func-recur n)
  (if
    (< n 3)
    n
    (+
      (func-recur (- n 1))
      (* 2 (func-recur (- n 2)))
      (* 3 (func-recur (- n 3)))
    )
  )
)

(print (func-recur 6))

; ===============================================

; iterative solution

; The iterative solution is built on the following known base cases:
; f(0) = 0
; f(1) = 1
; f(2) = 2
; All subsequent f(n) values will be derived from the base case, i.e.
; f(3) = f(2) + 2f(1) + 3f(0) which will give us f(3) = 2 + 2 + 0
; f(4) = f(3) + 2f(2) + 3f(1) which will give us f(4) = 4 + 4 + 3

; Note the parameters of func-loop
; a is the value of f(n-1) and is initialized as f(2)
; b is the value of f(n-2) and is initialized as f(1)
; c is the value of f(n-3) and is initialized as f(0)

(define (func-iter n)
  (define (func-loop a b c count)
    (if
      (= count n)
      a
      (func-loop (+ a (* 2 b) (* 3 c)) a b (+ count 1))
    )
  )

  (if
    (< n 3)
    n
    (func-loop 2 1 0 2)
  )
)

(print (func-iter 6))