 (define (first-denomination denominations) (car denominations)) 
 (define (except-first-denom denominations) (cdr denominations)) 
 (define (no-more? denominations) (null? denominations)) 
  
 (define (cc amount denominations) 
   (cond  
    ((= amount 0) 1) 
     
    ((or (< amount 0) (no-more? denominations)) 0) 
     
    (else 
     ;; plus the number of ways after subtracting the amount of the 
     (+ (cc amount (except-first-denom denominations)) 
        (cc (- amount  
               (first-denomination denominations))  
            denominations))))) 
