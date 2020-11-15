; Alyssa's algorithm:
(define (expmod base exp m)
  (remainder (fast-expt base exp) m)
)

; Alyssa's algorithm will indeed provide us with the correct result, but
; it requires us to compute the entirety of base^exp, store it in memory,
; and only then compute (remainder x m)

; In contrast, the original algorithm never actually computes base^prime
; in its complete form, rather, it is broken up. From the following, we 
; can see that the remainder is being computed before the squaring occurs
; at each step, keeping the intermediate result as smaller numbers

(expmod 2 4 4)
(r (sq (expmod 2 2 4)) m)
(r (sq (r (sq (expmod 2 1 4)) m)) m)
(r (sq (r (sq ((r (* 2 (expmod 2 0 4)) m)) m)) m)

; With large exp values, Alyssa's algorithm will require a much larger memory
; to store the intermediate result. Furthermore, artihmatic computation with
; large numbers is slower - i.e. it can no longer have order of growth of 
; 'normal' number arithmatic, which is O(1).

; See a better explantation here: https://codology.net/post/sicp-solution-exercise-1-25/
