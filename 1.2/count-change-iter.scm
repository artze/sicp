(define (cc-penny amount acc)
  (cond
    ((= amount 0) (+ acc 1))
    ((< amount 0) acc)
    (else (cc-penny (- amount 1) acc))
  )
)

(define (cc-nickel amount acc)
  (cond
    ((= amount 0) (+ acc 1))
    ((< amount 0) acc)
    (else (cc-nickel (- amount 5) (cc-penny amount acc)))
  )
)

(define (cc-dime amount acc)
  (cond
    ((= amount 0) (+ acc 1))
    ((< amount 0) acc)
    (else (cc-dime (- amount 10) (cc-nickel amount acc)))
  )
)

(define (cc-quarter amount acc)
  (cond
    ((= amount 0) (+ acc 1))
    ((< amount 0) acc)
    (else (cc-quarter (- amount 25) (cc-dime amount acc)))
  )
)

(define (cc-half amount acc)
  (cond
    ((= amount 0) (+ acc 1))
    ((< amount 0) acc)
    (else (cc-half (- amount 50) (cc-quarter amount acc)))
  )
)

(define (count-change-iter amount)
  (cc-half amount 0)
)

(print (count-change-iter 100))

; with help from https://wiki.c2.com/?SicpIterationExercise
; Also have a look at guide to solution https://stackoverflow.com/a/1485122/5204647
