; Pascal's Triangle will be represented as follows:
; 1
; 1 1
; 1 2 1
; 1 3 3 1

; The following procedure will compute the value of an element,
; at a row, column position (i.e. row 3 col 2 returns 2)

(define (get-pascal-elem r c)
  (if (or (= c 1) (= r c))
    1
    (+
      (get-pascal-elem (- r 1) (- c 1))
      (get-pascal-elem (- r 1) c)
    )
  )
)

(print (get-pascal-elem 6 4))