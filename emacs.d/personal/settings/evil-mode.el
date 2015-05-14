;;; evil-mode.el --- Customize Evil Mode

;;; Commentary:

;; Configures evil mode

;;; Code:

(setq evil-mode-line-format 'nil)
(evil-exchange-install)
(evilnc-default-hotkeys)

;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

;; bind evil-forward/backward-args
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)

;; bind evil-jump-out-args
(define-key evil-normal-state-map "K" 'evil-jump-out-args)

;; Magit rebase mode should use emacs mode
(setq evil-emacs-state-modes (append evil-emacs-state-modes
                                     '(git-rebase-mode)))
(evil-add-hjkl-bindings git-rebase-mode-map 'emacs)
;;; evil-mode.el ends here
