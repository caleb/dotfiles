;;;###autoload
(defun personal/bind-key (prefix keys binding)
  "Binds a command with a prefix to a non-controlled and controlled version"
  (let* ((lst (split-string keys " "))
         (ctrl-keys (mapconcat (lambda (key) (concat "C-" key)) lst " ")))
    (global-set-key (kbd (concat prefix " " keys)) binding)
    (print (concat prefix " " ctrl-keys))
    (global-set-key (kbd (concat prefix " " ctrl-keys)) binding)
   ))
