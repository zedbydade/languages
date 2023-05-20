(define (scale-list items factor)
  (if (null? items)
    nil 
    (cons (*(car items) factor)
          (scale-list (cdr items)
                      factor))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))


