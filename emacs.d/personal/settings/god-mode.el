(require 'god-mode)

;; Change the cursor in god mode
(defun personal/god-mode-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'personal/god-mode-cursor)
(add-hook 'god-mode-disabled-hook 'personal/god-mode-cursor)

;; Use C-i to enter god-mode
(personal/bind-key "C-l" "i" 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode)

;; Use i to leave god mode
(define-key god-local-mode-map (kbd "i") 'god-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
