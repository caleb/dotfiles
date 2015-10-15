;;; linum.el --- Settings for linum (and nlinum)

;;; Commentary:

;; Settings for linum and nlinum

;;; Code:

(require 'hlinum)
(hlinum-activate)

(setq linum-format " %d ")
(global-linum-mode 1)

;; Set the linum background color to be the same as the background in gruvbox
(set-face-attribute 'linum nil :background (if (display-graphic-p) "#282828" "color-235"))
(set-face-attribute 'linum-highlight-face nil :background (if (display-graphic-p) "#3c3836" "color-237") :foreground (if (display-graphic-p) "#fabd2f" "color-214"))

;;; linum.el ends here
