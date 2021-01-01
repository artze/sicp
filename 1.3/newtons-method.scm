; Reference for Newton's Method
; Explanation for using Newton's Method to find root of equation
; https://amsi.org.au/ESA_Senior_Years/SeniorTopic3/3j/3j_2content_2.html

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

; Find square-root with Newton's Method
; 
; To find sqrt of x, we can use f(y) = y^2 - x
; By solving for f(y) = 0, we will come to y^2 = x
; where the answer y (produced by the approximation)
; will be the sqrt of x

(define (square x) (* x x))

(define (sqrt x)
  (newtons-method
    (lambda (y) (- (square y) x))
    1
  )
)

(print (sqrt 144))