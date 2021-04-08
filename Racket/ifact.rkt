(define fact
  (lambda (n a)
    (cond
      ((zero? n) a)
      (else (fact (- n 1) (* n a))))))

(fact 3 1)
(fact 5 1)
(fact 20 1)