; ===== Prime Number Check =====
(define (square x)
  (* x x)
)

(define (smallest-divisor n)
  (define (next x)
    (if (= x 2)
      3
      (+ x 2)
    )
  )
  (define (find-divisor n a)
    (cond
      ((> (square a) n) n)
      ((= (remainder n a) 0) a)
      (else (find-divisor n (next a)))
    )
  )
  (find-divisor n 2)
)

(define (is-prime? x)
  (= (smallest-divisor x) x)
)

; ===== Filtered Accumulate =====
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
    null-value
    (combiner
      (if (filter a)
        (term a)
        null-value
      )
      (filtered-accumulate combiner null-value term (next a) next b filter)
    )
  )  
)

; Section A
; Sum of squares of prime numbers in the interval a to b
(define (inc x) (+ x 1))

(define (sum-of-sq-of-prime a b)
  (filtered-accumulate + 0 square a inc b is-prime?)
)

(print (sum-of-sq-of-prime 2 5))

; Section B
; Product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1). 
; ===== GCD =====
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))
  )
)

(define (prod-prime-to-n n)
  (define (is-relative-prime? x)
    (= (gcd x n) 1)
  )
  (filtered-accumulate * 1 identity 2 inc n is-relative-prime?)
)

(print (prod-prime-to-n 9))