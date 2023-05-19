(define (last-pair items) 
   (let ((rest (cdr items))) 
     (if (null? rest) 
         items 
         (last-pair rest)))) 
(display (last-pair (list 23 72 149 34)))

