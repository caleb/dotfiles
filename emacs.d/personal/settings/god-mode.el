;;; god-mode.el --- Settings for god-mode

;;; Commentary:

;; Settings for god-mode

;;; Code:

(require 'god-mode)
(require 'smart-mode-line)

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
  (interactive)
  (if god-local-mode
      (progn
        (set-face-attribute 'mode-line-buffer-id nil :inherit 'sml/filename :foreground nil :background nil)
        (set-face-attribute 'mode-line-inactive nil :foreground "gray60" :background "#404045" :inverse-video nil)
        (set-face-attribute 'mode-line nil :foreground "gray60" :background "black" :inverse-video nil)
        (set-face-attribute 'sml/global nil :foreground "gray50" :inverse-video nil)
        (set-face-attribute 'sml/modes nil :inherit 'sml/global :foreground "White")
        (set-face-attribute 'sml/filename nil :inherit 'sml/global :foreground "#eab700"  :weight 'bold)
        (set-face-attribute 'sml/prefix nil :inherit 'sml/global :foreground "#bf6000")
        (set-face-attribute 'sml/read-only nil :inherit 'sml/global :foreground "DeepSkyBlue")
        ; (set-face-attribute 'persp-selected-face nil :foreground "ForestGreen" :inherit 'sml/filename)
        (set-face-attribute 'helm-candidate-number nil :foreground nil :background nil :inherit 'sml/filename))
    (progn
      (set-face-attribute 'mode-line-buffer-id nil :inherit 'sml/filename :foreground nil :background nil)
      (set-face-attribute 'mode-line-inactive nil :foreground "grey20" :background "#fdf6e3" :inverse-video nil)
      (set-face-attribute 'mode-line nil :foreground "black" :background "gray85" :inverse-video nil)
      (set-face-attribute 'sml/global nil :foreground "gray20" :inverse-video nil)
      (set-face-attribute 'sml/modes nil :inherit 'sml/global :foreground "Black")
      (set-face-attribute 'sml/filename nil :inherit 'sml/global :foreground "Blue")
      (set-face-attribute 'sml/prefix nil :inherit 'sml/global :foreground "#5b2507")
      (set-face-attribute 'sml/read-only nil :inherit 'sml/not-modified :foreground "DarkGreen"))))

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
