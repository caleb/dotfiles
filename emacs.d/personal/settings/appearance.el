;;; appearance.el --- Settings related to Emacs appearance

;;; Commentary:

;; Settings related to Emacs appearance

;;; Code:

;; hide the menu bar
(menu-bar-mode 0)

;; hide the scrollbars
(scroll-bar-mode -1)

;; disable the splash screen
(setq inhibit-splash-screen t)

;; load theme
(setq personal/theme-loaded-p nil)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (if (not personal/theme-loaded-p)
                    (progn
                      (setq personal/theme-loaded-p t)
                      (select-frame frame)
                      (load-theme 'gruvbox t)
                      (personal/reset-mode-line)))))
  (load-theme 'gruvbox t))

;; Speed up the performance of the display engine.
;; See http://www.masteringemacs.org/article/improving-performance-emacs-display-engine
(setq redisplay-dont-pause t)

(set-face-attribute 'default nil
                    :family "Inconsolata" :height 160 :weight 'regular)

;;; appearance.el ends here
