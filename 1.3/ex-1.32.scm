; Accumulate recursive procedure

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))
  )
)

; Cumulative sum procedure defined with accumulate
(define (identity x) x)

(define (inc x) (+ x 1))

(define (sum a b)
  (accumulate + 0 identity a inc b)
)

(print (sum 1 10))


; Accumulate iterative procedure
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a ) (combiner result (term a)))
    )
  )
  (iter a null-value)
)

; Cumulative product procedure defined with accumlate-iter
(define (product-iter a b)
  (accumulate-iter * 1 identity a inc b)
)

(print (product-iter 1 6))