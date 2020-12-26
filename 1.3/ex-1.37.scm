; Recursive Process
(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
      (/ (n i) (d i))
      (/
        (n i)
        (+ (d i) (recur (+ i 1)))
      )
    )
  )
  (recur 1)
)

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

(print (cont-frac-recur
  (lambda (i) 1.0)
  (lambda (i) 1.0)
  12
))

(print (cont-frac-iter
  (lambda (i) 1.0)
  (lambda (i) 1.0)
  12
))

; let gr = Golden Ratio
; 1/gr = 0.618033988749895

; the 12th term produces 1/gr accurate to 4 decimal places