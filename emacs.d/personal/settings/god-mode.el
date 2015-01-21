;;; god-mode.el --- Settings for god-mode

;;; Commentary:

;; Settings for god-mode

;;; Code:

(require 'god-mode)

;; Change the cursor in god mode
(defun personal/god-mode-cursor ()
  "Set the cursor type to indicate whether god-mode is enabled."
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'personal/god-mode-cursor)
(add-hook 'god-mode-disabled-hook 'personal/god-mode-cursor)

;; Change the mode-line in god mode
(defun personal/god-mode-mode-line ()
  "Set the mode line to indicate whether god-mode is enabled."
  (if god-local-mode
      (progn (set-face-background 'mode-line "#1d2021"))
    (progn (set-face-background 'mode-line "#5f0000"))))

(add-hook 'god-mode-enabled-hook 'personal/god-mode-mode-line)
(add-hook 'god-mode-disabled-hook 'personal/god-mode-mode-line)

;; Use C-i to enter god-mode
(personal/bind-key "C-l" "i" 'god-mode-all)
(global-set-key (kbd "<escape>") 'god-mode-all)

;; Use i to leave god mode
(define-key god-local-mode-map (kbd "i") 'god-mode-all)
(define-key god-local-mode-map (kbd ".") 'repeat)

;; Disable smartparens mode while god-mode is enabled (smartparens mode rebinds
;; many keys to do its magic, including "n" which interferes with the use of
;; god-mode)
(add-hook 'god-mode-enabled-hook (lambda ()
                                   (interactive)
                                   (smartparens-mode -1)))

(add-hook 'god-mode-disabled-hook (lambda ()
                                    (interactive)
                                    (smartparens-mode +1)))

; Enable God mode by default
(god-mode-all)

;;; god-mode.el ends here
