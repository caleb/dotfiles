(require 'multiple-cursors)

(mapc (lambda (cmd)
        (add-to-list 'mc/cmds-to-run-once cmd))
      '(
        god-local-mode
        helm-confirm-and-exit-minibuffer
        split-window-horizontally
        ))
