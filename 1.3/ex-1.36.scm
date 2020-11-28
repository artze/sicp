; ===== Fixed Point Method =====
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance)
  )
  (define (try guess)
    (print guess)
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

; ===== Find x so that x = (log 1000) / log x =====
; Without average damping

; (fixed-point
;   (lambda (x) (/ (log 1000) (log x)))
;   2
; )

; With average damping
(fixed-point
  (lambda (x)
    (/
      (+ (/ (log 1000) (log x)) x)
      2
    )
  )
  2

)

; Without average damping: 34 steps
; With average damping: 9 steps