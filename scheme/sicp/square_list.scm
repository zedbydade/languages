(define (square-list items)
  (if (null? items)
    items
    (const (square (car items)) (square-list (cdr items)))))

(define (sq2 items)
  (map (lambda (x) (square x)) items))
