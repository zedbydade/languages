(lambda (x) (+ x 4))

(lambda (x) (/ 1.0 (* x (+ x 2))))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+x 2))))
       a 
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum fun 
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))

(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (-1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
