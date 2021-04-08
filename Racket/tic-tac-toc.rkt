(define x (read))
(define y (read))

(define f
  (lambda (x y)
    (do ((i 0 (+ i 1)))
      ((= i y) (do ((r 0 (+ r 1)))
                 ((= r x) (display "+\n"))
                 (display "+---")))
      (do ((j 0 (+ j 1)))
        ((= j x) (display "+\n"))
        (display "+---"))
      (do ((k 0 (+ k 1)))
        ((= k x) (display "|\n"))
        (display "|   ")))))

(f x y)