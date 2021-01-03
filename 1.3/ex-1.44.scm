; compose procedure
(define (compose f g)
  (lambda (x)
    (f (g x))
  )
)

; repeat procedure
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))
  )
)

; smooth procedure
(define (average-of-3 a b c)
  (/
    (+ a b c)
    3
  )
)

(define (smooth f)
  (define dx 0.0001)
  (lambda (x)
    (average-of-3
      (f (- x dx))
      (f x)
      (f (+ x dx))
    )
  )
)

; n-fold-smooth procedure
(define (n-fold-smooth f n)
  ((repeated smooth n) f)
)
