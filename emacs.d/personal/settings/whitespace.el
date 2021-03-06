;;; whitespace.el --- Sets up whitespace

;;; Commentary:

;; Sets up whitespace

;;; Code:

;; use spaces instead of tabs
(setq-default tab-width        2)
(setq         tab-stop-list    (number-sequence 2 120 2))


;; setup junk whitespace types for when whitespace mode is active
(setq whitespace-style '(face tabs trailing empty))

;;; whitespace.el ends here
