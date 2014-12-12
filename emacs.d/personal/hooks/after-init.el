(global-unset-key (kbd "C-l"))
(define-prefix-command 'personal-map)
(global-set-key (kbd "C-l") 'personal-map)
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

;; frame and window management
(global-set-key (kbd "C-l f c") 'make-frame-command)
(global-set-key (kbd "C-l f k") 'delete-frame)
(global-set-key (kbd "C-l f f") (lambda ()
                                  (interactive)
                                  (other-frame -1)))
(global-set-key (kbd "C-l f F") (lambda ()
                                  (interactive)
                                  (other-frame 1)))

(global-set-key (kbd "C-l f s") 'split-window-vertically)
(global-set-key (kbd "C-l f v") 'split-window-horizontally)
(global-set-key (kbd "C-l f q") 'delete-window)
(global-set-key (kbd "C-l f o") (lambda ()
                                  (interactive)
                                  (other-window -1)))
(global-set-key (kbd "C-l f O") (lambda ()
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
;; (global-unset-key (kbd "C-x C-b"))

;; command shortcuts
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-l /") 'personal/comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-l l")   'personal/newline-below)
(global-set-key (kbd "C-l L")   'personal/newline-above)
(global-set-key (kbd "C-l RET") 'personal/newline-between)

(global-set-key (kbd "C-l v m") 'mc/edit-lines)

(global-set-key (kbd "C-l #") 'personal/insert-header-comment)

(global-set-key (kbd "C-l r")   'replace-string)
(global-set-key (kbd "C-l R")   'replace-regexp)
(global-set-key (kbd "C-l o e") 're-builder)


(global-set-key (kbd "C-l -") (lambda ()
                                (interactive)
                                (dired (file-name-directory (buffer-file-name)))))

(global-set-key (kbd "C-l .") 'repeat)

(global-set-key (kbd "C-l v e") 'er/expand-region)
(global-set-key (kbd "C-l v '") 'er/mark-inside-quotes)
(global-set-key (kbd "C-l v p") 'er/mark-inside-pairs)

(global-set-key (kbd "C-l s") 'idomenu)

(global-set-key (kbd "C-l a") 'ag-project-regexp)
(global-set-key (kbd "C-l A") 'ag-project-dired-regexp)

(global-set-key (kbd "C-l H") 'personal/htmlify-buffer)
(global-set-key (kbd "C-l h") 'personal/htmlify-buffer-light)

(global-set-key (kbd "C-l g g") 'magit-status)
(global-set-key (kbd "C-l g b") 'vc-annotate)
(global-set-key (kbd "C-l g p") 'yagist-region-or-buffer)

(global-set-key (kbd "C-l w b") 'personal/trim-backwards)
(global-set-key (kbd "C-l w f") 'personal/trim-forwards)
(global-set-key (kbd "C-l w a") 'personal/trim-backwards-and-forwards)
(global-set-key (kbd "C-l w t") 'delete-trailing-whitespace)
(global-set-key (kbd "C-l w w") 'fixup-whitespace)
(global-set-key (kbd "C-l SPC") 'personal/fix-all-whitespace)

(global-set-key (kbd "C-l b l") 'linum-mode)

(global-set-key (kbd "C-l o r") 'inf-ruby)
(global-set-key (kbd "C-l o R") 'personal/rails-console)
(global-set-key (kbd "C-l o d") 'personal/rails-dbconsole)
(global-set-key (kbd "C-l o s") 'personal/open-shell-in-ansi-term)
(global-set-key (kbd "C-l o m") 'man)
(global-set-key (kbd "C-l o c") 'calc)
(global-set-key (kbd "C-l o l") 'ielm)
(global-set-key (kbd "C-l o i") 'personal/erc-connect)

;; Allow - to go up a directory in dired (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)
