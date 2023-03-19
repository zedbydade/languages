(define (expt b n)
  (if (= n 0) 
    1
    (* b (expt b (- n 1)))))

(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= count 0) 
    product 
    (expt-iter b 
               (- counter 1)
               (* b product))))

(define (fast-extp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-extp b (/ n 2))))
        (else (* b (fast-extp b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))
