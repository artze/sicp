; Recursive procedure (for reference)
; (define (sum term a next b)
;   (if
;     (> a b)
;     0
;     (+ (term a) (sum term (next a) next b))
;   )
; )

; Iterative procedure
(define (sum term a next b)
  (define (iter a result)
    (if
      (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

; Test adding 1 through 10
(define (identity x) x)
(define (inc x) (+ x 1))

(print (sum identity 0 inc 10))