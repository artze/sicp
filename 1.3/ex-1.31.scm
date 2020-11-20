(flonum-print-precision 17)
; ===== Section A =====
; Write a higher order procedure that computes product of a range

(define (product term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))
  )
)

; Compute factorial using this higher order procedure
(define (identity x) x)
(define (inc x) (+ x 1))

(define (factorial x)
  (product identity 1 inc x)
)

(print (factorial 6))

; Compute approximations of pi
; The formula given in the exercise is the Wallis Formula

(define (square x)
  (* x x)
)

(define (pi-wallis n)
  (define (term x)
    (/ 
      (* 4 (square x))
      (- (* 4 (square x)) 1)
    )
  )
  (* 2 (product term 1 inc n))
)

(print (pi-wallis 100))


; ===== Section B =====
; Write the same higher order procedure but in iterative form

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

