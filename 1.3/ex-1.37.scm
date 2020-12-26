; Recursive Process
(define (cont-frac-recur n d k)
  (define (recur n d k c)
    (if (= c k)
      (/ (n c) (d c))
      (/
        (n c)
        (+ (d c) (recur n d k (+ c 1)))
      )
    )
  )
  (recur n d k 1)
)

; Iterative Process
(define (cont-frac-iter n d k)
  (define (iter n d k temp)
    (if (= k 1)
      (/ (n k) temp)
      (iter n d (- k 1) (+ (d (- k 1)) (/ (n k) temp)))
    )
  )
  (iter n d (- k 1) (+ (d (- k 1)) (/ (n k) (d 3))))
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