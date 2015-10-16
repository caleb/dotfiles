;;; appearance.el --- Settings related to Emacs appearance

;;; Commentary:

;; Settings related to Emacs appearance

;;; Code:

;; hide the scroll bars
(scroll-bar-mode -1)

;; Speed up the performance of the display engine.
;; See http://www.masteringemacs.org/article/improving-performance-emacs-display-engine
(setq redisplay-dont-pause t)

;; set our font
(set-face-attribute 'default nil
  :family "Hack" :height 150 :weight 'regular)

;; tell Prelude what theme to use
(setq prelude-theme 'gruvbox)

;;; appearance.el ends here
