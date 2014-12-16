(require 'multiple-cursors)

(smartrep-define-key global-map "C-l v" '(("n" . 'mc/mark-next-lines)
                                          ("p" . 'mc/mark-previous-lines)
                                          (">" . 'mc/mark-next-like-this)
                                          ("<" . 'mc/mark-previous-like-this)))

(smartrep-define-key global-map "C-l C-v" '(("C-n" . 'mc/mark-next-lines)
                                            ("C-p" . 'mc/mark-previous-lines)
                                            ("C->" . 'mc/mark-next-like-this)
                                            ("C-<" . 'mc/mark-previous-like-this)))

(mapc (lambda (cmd)
        (add-to-list 'mc/cmds-to-run-for-all cmd))
      '(
        sp--self-insert-command
        ))

(mapc (lambda (cmd)
        (add-to-list 'mc/cmds-to-run-once cmd))
      '(
        god-mode
        god-mode-all
        god-local-mode
        helm-confirm-and-exit-minibuffer
        split-window-horizontally
        split-window-vertically
        mc/mark-next-lines
        mc/mark-next-like-this
        undo-tree-visualizer-quit
        keyboard-escape-quit
        ))
