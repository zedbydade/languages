(define (for-Each proc items)
  (if (null? items)
    #t 
    (and (proc (car items)) (for-Each proc (cdr items)))))
