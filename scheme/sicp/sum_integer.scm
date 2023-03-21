(define (sum-integers a b)
  (if (> a b)
    0 
    (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
    0 
    (+ (cube a)
       (sum-cubes (+ a 1) b))))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2)))))
(define (pi-next x)
  (+ x 4))
(sum pi-term a pi-next b)
