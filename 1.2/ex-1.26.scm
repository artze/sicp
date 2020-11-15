; In Louis' algorithm, when exp is even, each call to expmod spawns 
; 2 branches, causing the number of steps to grow like a tree.

; To illustrate, we will use base 2 with exp 8 as example. With Louis'
; algorithm, the number of calls to expmod can be represented by a tree
; with 3 levels, with each level splitting into 2 branches

; Let the num of leaves in tree to be x
;                        x = 2 ^ (log exp) 
;                    log x = log exp
;                        x = exp

; As the num of leaves is proportional to the total number of steps,
; we can say the order of growth to be O(n).

; ====================================================================

; In the original algorithm, the number of calls to expmod does not
; split into branches. The number of calls to expmod will then equal
; the number of 'levels', which can be represented by log exp. 

; The order of growth will then be O(log n).