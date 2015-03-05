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

(smartrep-define-key global-map "C-l C-v" '(("n" . 'mc/mark-next-lines)
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
(add-hook 'multiple-cursors-mode-enabled-hook (lambda ()
                                                (setq evil-move-cursor-back nil)))

(add-hook 'multiple-cursors-mode-disabled-hook (lambda ()
                                                 (setq evil-move-cursor-back t)))

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
