; Iterative Process
(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (= k 0)
      result
      (iter (- k 1) (/ (n k) (+ (d k) result)))
    )
  )
  (iter (- k 1) (/ (n k) (d k)))
)

(print (cont-frac-iter
  (lambda (i) 1.0)
  (lambda (i) 
    (if (= (modulo i 3) 2)
      (- i (/ (- i 2) 3))
      1
    )
  )
  11
))

; natural base, e is 2.71828182845904523536
; cont-frac-iter above produces the answer 0.718281835205993 with k=11