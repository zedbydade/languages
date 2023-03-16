(+ 137 349)
(- 1000 334)
(* 5 99)
(/ 10 5)
(+ 2.7 10)

(+ 21 35 12 17)
(* 25 4 12)

(+ (* 3 5) (- 10 6))

(+ (* 3 
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7))
        6))

(define size 2)
(* 5 size)

(* (+ 2 (* 4 6))
   (+ 3 5 6))

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (x -))))

(define (sqrt-iter guexx x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x
                 (average guess (/ x guess))))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

