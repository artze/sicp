; ===== Helper Procedures =====
; fixed-point procedure
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

; average-damp procedure
(define (average a b)
  (/
    (+ a b)
    2
  )
)

(define (average-damp f)
  (lambda (x)
    (average x (f x))
  )
)

; repeat procedure
(define (compose f g)
  (lambda (x)
    (f (g x))
  )
)

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))
  )
)

; ===== Experiment =====
; nth-root-damped with hardcoded average-damp-times
; (define (nth-root-damped x nth)
;   (fixed-point
;     (
;       (repeated average-damp 5)
;       (lambda (y) (/ x (expt y (- nth 1))))
;     )
;     1
;   )
; )

; (print (nth-root-damped 3 32))

; Experiment Results
; nth      no. of avg damping
; ===========================
; 2         1
; 3         1
; 4         2
; 5         2
; 6         2
; 7         2
; 8         3
; 9         3
; 10        3
; 11        3
; 12        3
; 13        3
; 14        3
; 15        3
; 16        4
; ...
; 31        4
; 32        5


; The no. of avg damping can be represented by the floor
; of log base 2 of x

; ===== Solution =====
(define (get-average-damping-times x)
  (floor (/ (log x) (log 2)))
)

(define (nth-root-damped x nth)
  (fixed-point
    (
      (repeated average-damp (get-average-damping-times nth))
      (lambda (y) (/ x (expt y (- nth 1))))
    )
    1
  )
)

(print (nth-root-damped 3 64))