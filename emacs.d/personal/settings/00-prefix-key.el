;;; 00-prefix-key.el --- Our Personal prefix key

;;; Commentary:

;; Sets up our personal prefix key C-l

;;; Code:

(global-unset-key (kbd "C-l"))
(define-prefix-command 'personal-map)
(global-set-key (kbd "C-l") 'personal-map)

;;; 00-prefix-key.el ends here
