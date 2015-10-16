;;; linum.el --- Settings for linum (and nlinum)

;;; Commentary:

;; Settings for linum and nlinum

;;; Code:

(require 'hlinum)
(hlinum-activate)

;; Align line numbers to the right with some padding around them
(add-hook 'linum-before-numbering-hook
  (lambda ()
    (setq-local linum-format-fmt
      (let ((w (length (number-to-string
                         (count-lines (point-min) (point-max))))))
        (concat "%" (number-to-string w) "d")))))
(defun personal/linum-format-func (line)
  (concat
    " "
    (propertize (format linum-format-fmt line) 'face 'linum)
    " "))
(setq linum-format 'personal/linum-format-func)

(global-linum-mode 1)

;; Set the linum background color to be the same as the background in gruvbox
(set-face-attribute 'linum nil :background (if (display-graphic-p) "#282828" "color-235"))
(set-face-attribute 'linum-highlight-face nil :background (if (display-graphic-p) "#3c3836" "color-237") :foreground (if (display-graphic-p) "#fabd2f" "color-214"))

;;; linum.el ends here
