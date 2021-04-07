(define fact
  (lambda (n)
    (cond
      ((zero? n) 1)
      (else (* n(fact (- n 1)))))))

(fact 3)
(fact 5)
(fact 20)