(require 'multiple-cursors)

(smartrep-define-key global-map "C-l v" '(("n" . 'mc/mark-next-lines)
                                          ("p" . 'mc/mark-previous-lines)
                                          (">" . 'mc/mark-next-like-this)
                                          ("<" . 'mc/mark-previous-like-this)))

(mapc (lambda (cmd)
        (add-to-list 'mc/cmds-to-run-for-all cmd))
      '(
        sp--self-insert-command
        prelude-move-beginning-of-line
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
