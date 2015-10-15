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
(set-face-attribute 'linum-highlight-face nil :background (if (display-graphic-p) "#282828" "color-235"))

;;; linum.el ends here
