(define abs1
  (lambda (x)
    (if (> x 0) x
        (- x))))
(define f abs1)
(f 10)
(f -20)