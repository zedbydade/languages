(define (times b n)
  (define (iter b n sum)
    (cond ((= n 0) sum)
          ((even? n) (iter (double b) (halve n) sum))
          (else (iter b (- n 1) (+ b sum)))))
  (if (< n 0)
      (iter (- b) (- n) 0)
      (iter b n 0)))

(define (double x) (ash x 1))
(define (halve x) (ash x -1))
