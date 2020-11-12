; This question isn't easy to understand but the gist of it is as follows.

; First we will declare:
; normal T as a < a + b; b < a (same as the fib-iter example given earlier)
; special T as a < bq + aq + ap; b < bp + aq

; The following observations can be made:
; - Special T will give us the same results as normal T when p=0, q=1 -- i.e. the next term (n + 1) in Fib sequence
; - When we apply special T twice (with p=0, q=1), we will simply get the (n + 2)th term in Fib sequence. Try to find
;   values for p and q, such that applying special T ONCE will give us the (n + 2)th term.
; - We will observe that when p=1 q=1, special T will provide us (n + 2)th term in Fib sequence. With p=1 q=2, we
;   will get the (n + 3)th term. With p=2 q=3, we will get the (n + 4)th term.
; - The cricital observation is that p and q values need to be a Fib set as well, with q taking the value of a, and
;   p taking the value of b, in order to jump through the Fib sequence.
; - The question wants us to compute the updated values of p' and q' in terms of its former values p and q, such that
;   applying special T ONCE will give us the same result as applying special T TWICE (with the former values). 
; - Since p and q are a Fib set, we can simply use special T to compute new values of p' and q'. By substituting a with
;   q and b with p, we get the following:
;     q' = pq + q^2 + pq = 2pq + q^2
;     p' = p^2 + q^2
;   With p and q values becoming successively larger, we can now jump through many more steps in the Fib sequence:
;     - Large p and q values will generate even larger p and q values as we jump through more steps at each iteration
;     - With large p and q values, we are now able to jump through the Fib sequence in the original algorithm to compute
;       the nth term in a Fib sequence

; To illustrate the logarithmic growth, we can first list out the steps we can jump through, at each p and q values:
; p=0 q=1 - 1 step
; p=1 q=1 - 2 steps
; p=1 q=2 - 3 steps
; p=2 q=3 - 4 steps
; p=3 q=5 - 5 steps
; p=5 q=8 - 6 steps
; p=8 q=13 - 7 steps
; p=13 q=21 - 8 steps

; Since we are continually using the last p and q values in the special T transformation, we will not actually go through all
; possible Fib values (because we are successively jumping through more steps at each turn). We will observe the following:
; p=0 q=1 - 1 step
; p=1 q=1 - 2 steps
; p=2 q=3 - 4 steps
; p=13 q=21 - 8 steps

; In other words, when we are at a=3 b=2, using p=2 q=3 will allow us to jump 4 steps to a=21 b=13. At each iteration, we can
; jump twice the number of steps. With a procedure (fib-iter n) to find the nth term in Fib sequence, n needs to double before
; requiring 1 additional iteration.

(define (square x)
  (* x x)
)

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(print (fib 17))