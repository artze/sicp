; Helper to get derivative of function
(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/
      (- (g (+ x dx)) (g x))
      dx
    )
  )
)

; Helper to get the next approximation of equation root
(define (newton-transform g)
  (lambda (x)
    (-
      x
      (/ (g x) ((deriv g) x))
    )
  )
)

; Helper to find fixed-point of function
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

; Get root of equation by finding the fixed-point
; of next-approximation helper - as we get closer to
; the root of equation, the next-approximation result
; converges.
(define (newtons-method g guess)
  (fixed-point
    (newton-transform g)
    guess
  )
)

; Define cubic that approximates zeros of
; x^3 + ax^2 + bx + c

(define (cubic a b c)
  (lambda (x)
    (+
      (expt x 3)
      (* a (expt x 2))
      (* b x)
      c
    )
  )
)

(print (newtons-method (cubic -3.6 -3.8 14.7) -5))

; With a = -3.6; b = -3.8; c = 14.7, the roots are
; 3.47695, 2.11862, -1.99557 

; Which root is returned by newtons-method depends
; on the value of the inital guess