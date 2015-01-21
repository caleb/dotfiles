;;; linum.el --- Settings for linum (and nlinum)

;;; Commentary:

;; Settings for linum and nlinum

;;; Code:

(require 'nlinum)
(setq nlinum-format " %d ")

;; Set the linum background color to be the same as the background in gruvbox
(set-face-attribute 'linum nil :background (if (display-graphic-p) "#282828" "color-235"))

;;; linum.el ends here
