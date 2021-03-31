(define atom?
  (lambda (x)
         (and (not (pair? x))
              (not (null? x)))))

(define nil '())

(atom? 1)
(atom? #t)
(atom? "string")
(atom? nil)
(atom? (cons 1 nil))