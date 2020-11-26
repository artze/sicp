; Show that the golden ration (gr) is a fixed point transformation
; of f(x) = 1 + 1/x

; Knowing that gr^2 = gr + 1, we can simply divide gr on both sides
; to get gr = 1 + 1/gr which is equivalent to f(x) = 1 + 1/x

; Approximate golden ratio with fixed point method

; ===== Fixed Point Method =====
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance)
  )
  (define (try guess)
    (let
      ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )

  (try first-guess)
)

; ====== Approximate Golden Ratio =====
(print (
  fixed-point
  (lambda (x) (+ 1 (/ 1 x)))
  1.0
))