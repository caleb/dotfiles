;; Change the modeline in god mode
(defun personal/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))

;; Change the cursor in god mode
(defun personal/god-mode-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'personal/god-mode-cursor)
(add-hook 'god-mode-disabled-hook 'personal/god-mode-cursor)

;; Use C-i to enter god-mode
(global-set-key (kbd "C-i") 'god-local-mode)
;; Use i to leave god mode
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
