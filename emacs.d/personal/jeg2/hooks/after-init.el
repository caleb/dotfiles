;; frame and window management
(global-set-key (kbd "C-c f c") 'make-frame-command)
(global-set-key (kbd "C-c f k") 'delete-frame)
(global-set-key (kbd "C-c f f") (lambda ()
                                  (interactive)
                                  (other-frame -1)))
(global-set-key (kbd "C-c f F") (lambda ()
                                  (interactive)
                                  (other-frame 1)))

(global-set-key (kbd "C-c -") 'split-window-vertically)
(global-set-key (kbd "C-c |") 'split-window-horizontally)
(global-set-key (kbd "C-x o") (lambda ()
                                (interactive)
                                (other-window -1)))
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window 1)))

(global-set-key (kbd "C-M-n") 'personal/other-window-next-line)
(global-set-key (kbd "C-M-p") 'personal/other-window-previous-line)

(require 'window-number)
(window-number-mode)
;; tone down the garish appearance
(set-face-attribute 'window-number-face nil :background "#2a2a2a")
(set-face-attribute 'window-number-face nil :foreground "red")

(winner-mode)

(global-undo-tree-mode)

;; unbind some keystrokes
(global-unset-key (kbd "C-x C-u"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-x C-b"))

;; command shortcuts
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "M-;") 'personal/comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-c l")   'personal/newline-below)
(global-set-key (kbd "C-c L")   'personal/newline-above)
(global-set-key (kbd "C-c RET") 'personal/newline-between)

(global-set-key (kbd "C-x r e") 'mc/edit-lines)

(global-set-key (kbd "C-c #") 'personal/insert-header-comment)

(global-set-key (kbd "C-c r")   'replace-string)
(global-set-key (kbd "C-c R")   'replace-regexp)
(global-set-key (kbd "C-c o e") 're-builder)

(global-set-key (kbd "C-c e") 'er/expand-region)

(global-set-key (kbd "C-c s") 'idomenu)

(global-set-key (kbd "C-c a") 'ag-project-regexp)
(global-set-key (kbd "C-c A") 'ag-project-dired-regexp)

(global-set-key (kbd "C-c H") 'personal/htmlify-buffer)
(global-set-key (kbd "C-c h") 'personal/htmlify-buffer-light)

(global-set-key (kbd "C-c g g") 'magit-status)
(global-set-key (kbd "C-c g b") 'vc-annotate)
(global-set-key (kbd "C-c g p") 'yagist-region-or-buffer)

(global-set-key (kbd "C-c w b") 'personal/trim-backwards)
(global-set-key (kbd "C-c w f") 'personal/trim-forwards)
(global-set-key (kbd "C-c w a") 'personal/trim-backwards-and-forwards)
(global-set-key (kbd "C-c w t") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c w w") 'fixup-whitespace)
(global-set-key (kbd "C-c SPC") 'personal/fix-all-whitespace)

(global-set-key (kbd "C-c v l") 'linum-mode)

(global-set-key (kbd "C-c o r") 'inf-ruby)
(global-set-key (kbd "C-c o R") 'personal/rails-console)
(global-set-key (kbd "C-c o d") 'personal/rails-dbconsole)
(global-set-key (kbd "C-c o s") 'personal/open-shell-in-ansi-term)
(global-set-key (kbd "C-c o m") 'man)
(global-set-key (kbd "C-c o c") 'calc)
(global-set-key (kbd "C-c o l") 'ielm)
(global-set-key (kbd "C-c o i") 'personal/erc-connect)
