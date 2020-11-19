(define (sum term a next b)
  (if
    (> a b)
    0
    (+ (term a) (sum term (next a) next b))
  )
)

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (term x)
    (cond
      ((or (= x 0) (= x n)) (f (+ a (* x h))))
      ((even? x) (* 2 (f (+ a (* x h)))))
      ((odd? x) (* 4 (f (+ a (* x h)))))
    )
  )

  (* (/ h 3)
    (sum
      term
      a
      inc
      n
    )
  )
)

(define (cube x)
  (* x x x)
)

(integral-simpson cube 0 1 100)
(integral-simpson cube 0 1 1000)
