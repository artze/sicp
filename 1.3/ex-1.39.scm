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

(define (tan-cf x k)
  (define (square x) (* x x))
  (cont-frac-iter
    (lambda (i)
      (if (= i 1)
        x
        (- (square x))
      )
    )
    (lambda (i)
      (- (* i 2) 1)
    )
    k
  )
)

(print (tan-cf 0.8 12))

; tan 0.8 = 1.02963855705
; tan-cf above produces answer 1.02963855705036 when k=12