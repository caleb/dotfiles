;;; multiple-cursors.el --- Settings for multiple-cursors

;;; Commentary:

;; Settings for multiple-cursors

;;; Code:

(require 'multiple-cursors)

(smartrep-define-key global-map "C-l v" '(("n" . 'mc/mark-next-lines)
                                          ("p" . 'mc/mark-previous-lines)
                                          (">" . 'mc/mark-next-like-this)
                                          ("<" . 'mc/mark-previous-like-this)
                                          ("j" . 'mc/mark-next-like-this)
                                          ("k" . 'mc/mark-previous-like-this)
                                          ("m" . 'mc/mark-more-like-this-extended)
                                          ("u" . 'mc/unmark-next-like-this)
                                          ("U" . 'mc/unmark-previous-like-this)
                                          ("s" . 'mc/skip-to-next-like-this)
                                          ("S" . 'mc/skip-to-previous-like-this)
                                          ("*" . 'mc/mark-all-like-this)
                                          ("d" . 'mc/mark-all-like-this-dwim)
                                          ("e" . 'mc/edit-lines)
                                          ("#" . 'mc/insert-numbers)
                                          ("o" . 'mc/sort-regions)
                                          ("O" . 'mc/reverse-regions)))

;; When multiple cursors are enabled, prevent moving the cursor back when exiting
;; insert mode in evil-mode
;;
;; Also disable aggressive indent mode when multiple cursors are enabled since aggressive indent
;; will make wonky things happen with mc
(defvar-local personal/mc/aggressive-mode-state nil) ;; nil for not set, 0 for disabled and 1 for enabled
(add-hook 'multiple-cursors-mode-enabled-hook (lambda ()
                                                ;; this hook may be called multiple times when adding more cursors so make sure we only
                                                ;; remember the state of aggressive indent mode when it's called the first time
                                                ;; (that is, when the personal/mc/aggressive-mode-state variable is nil)
                                                (unless (integerp personal/mc/aggressive-mode-state)
                                                  (setq-local personal/mc/aggressive-mode-state
                                                              (if (bound-and-true-p aggressive-indent-mode)
                                                                  1
                                                                0)))

                                                ;; disable aggressive indent mode
                                                (if (bound-and-true-p aggressive-indent-mode)
                                                    (aggressive-indent-mode 0))
                                                (setq evil-move-cursor-back nil)))

(add-hook 'multiple-cursors-mode-disabled-hook (lambda ()
                                                 (aggressive-indent-mode personal/mc/aggressive-mode-state)
                                                 ;; Reset the aggressive mode state variable so we can remember it for next time
                                                 (setq-local personal/mc/aggressive-mode-state nil)
                                                 (setq evil-move-cursor-back t)))


;;
;; Multiple cursors evil compat (use emacs mode during mc)
;;
(defun personal/evil-visual-or-normal-p ()
  "True if evil mode is enabled, and we are in normal or visual mode."
  (and (bound-and-true-p evil-mode)
       (not (memq evil-state '(insert emacs)))))

(defvar personal/evil-prev-state nil)
(defvar personal/mark-was-active nil)

(defun personal/switch-to-emacs-state ()
  (when (personal/evil-visual-or-normal-p)

    (setq personal/evil-prev-state evil-state)

    (when (region-active-p)
      (setq personal/mark-was-active t))

    (let ((mark-before (mark))
          (point-before (point)))

      (evil-emacs-state 1)

      (when (or personal/mark-was-active (region-active-p))
        (goto-char point-before)
        (set-mark mark-before)))))

(defun personal/back-to-previous-state ()
  (when personal/evil-prev-state
    (unwind-protect
        (case personal/evil-prev-state
          ((normal visual) (evil-force-normal-state))
          (t (message "Don't know how to handle previous state: %S"
                      personal/evil-prev-state)))
      (setq personal/evil-prev-state nil)
      (setq personal/mark-was-active nil))))

(add-hook 'multiple-cursors-mode-enabled-hook
          'personal/switch-to-emacs-state)
(add-hook 'multiple-cursors-mode-disabled-hook
          'personal/back-to-previous-state)

(defun personal/rectangular-switch-state ()
  (if rectangular-region-mode
      (personal/switch-to-emacs-state)
    (setq personal/evil-prev-state nil)))

;; When running edit-lines, point will return (position + 1) as a
;; result of how evil deals with regions
(defadvice mc/edit-lines (before change-point-by-1 activate)
  (when (user-utils/evil-visual-or-normal-p)
    (if (> (point) (mark))
        (goto-char (1- (point)))
      (push-mark (1- (mark))))))

(add-hook 'rectangular-region-mode-hook 'personal/rectangular-switch-state)

;;
;; Configure some default methods to execute for one or multiple cursors
;;
(mapc (lambda (cmd)
        (add-to-list 'mc/cmds-to-run-for-all cmd))
      '(
        evil-append-line
        evil-backward-WORD-begin
        evil-backward-char
        evil-backward-word-begin
        evil-delete-char
        evil-delete-line
        evil-digit-argument-or-evil-beginning-of-line
        evil-emacs-state
        evil-end-of-line
        evil-force-normal-state
        evil-forward-WORD-begin
        evil-forward-WORD-end
        evil-forward-char
        evil-forward-word-begin
        evil-forward-word-end
        evil-insert
        evil-next-line
        evil-normal-state
        evil-previous-line
        prelude-move-beginning-of-line
        sp--self-insert-command
        ))

(mapc (lambda (cmd)
        (add-to-list 'mc/cmds-to-run-once cmd))
      '(
        god-mode
        god-mode-all
        god-local-mode
        god-mode-self-insert
        helm-confirm-and-exit-minibuffer
        split-window-horizontally
        split-window-vertically
        mc/mark-next-lines
        mc/mark-next-like-this
        undo-tree-visualizer-quit
        undo-tree-visualize
        keyboard-escape-quit
        ))

;;; multiple-cursors.el ends here
