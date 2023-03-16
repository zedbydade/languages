(defun + (a b)
  (if (= a 0) b (inc (+ (dec a) b))))


(if (= 1 0) 2 (inc (+ (dec 1) 2))))


