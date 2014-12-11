;;;###autoload
(defun personal/flatten (x)
  "Flatten a list."
  (cond ((null x) nil)
        ((listp x) (append (personal/flatten (car x)) (personal/flatten (cdr x))))
        (t (list x))))
