(global-unset-key (kbd "C-l"))
(define-prefix-command 'personal-map)
(global-set-key (kbd "C-l") 'personal-map)
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom)

;; frame and window management
(personal/bind-key "C-l" "f c" '.make-frame-command)
(personal/bind-key "C-l" "f k" 'delete-frame)
(personal/bind-key "C-l" "f f" (lambda ()
                                  (interactive)
                                  (other-frame -1)))
(personal/bind-key "C-l" "f F" (lambda ()
                                  (interactive)
                                  (other-frame 1)))

(personal/bind-key "C-l" "f s" 'split-window-vertically)
(personal/bind-key "C-l" "f v" 'split-window-horizontally)
(personal/bind-key "C-l" "f q" 'delete-window)
(personal/bind-key "C-l" "f o" (lambda ()
                                  (interactive)
                                  (other-window -1)))
(personal/bind-key "C-l" "f O" (lambda ()
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

(personal/bind-key "C-l" "/" 'personal/comment-or-uncomment-region-or-line)

(personal/bind-key "C-l" "l"   'personal/newline-below)
(personal/bind-key "C-l" "L"   'personal/newline-above)
(personal/bind-key "C-l" "RET" 'personal/newline-between)

(personal/bind-key "C-l" "#" 'personal/insert-header-comment)

(personal/bind-key "C-l" "r"   'replace-string)
(personal/bind-key "C-l" "R"   'replace-regexp)
(personal/bind-key "C-l" "o e" 're-builder)


(personal/bind-key "C-l" "-" (lambda ()
                                (interactive)
                                (if (buffer-file-name)
                                    (dired (file-name-directory (buffer-file-name)))
                                    (dired default-directory))))

(personal/bind-key "C-l" "." 'repeat)

(personal/bind-key "C-l" "v e" 'er/expand-region)
(personal/bind-key "C-l" "v '" 'er/mark-inside-quotes)
(personal/bind-key "C-l" "v p" 'er/mark-inside-pairs)
(personal/bind-key "C-l" "v m" 'mc/edit-lines)

(personal/bind-key "C-l" "s" 'idomenu)

(personal/bind-key "C-l" "a" 'ag-project-regexp)
(personal/bind-key "C-l" "A" 'ag-project-dired-regexp)

(personal/bind-key "C-l" "H" 'personal/htmlify-buffer)
(personal/bind-key "C-l" "h" 'personal/htmlify-buffer-light)

(personal/bind-key "C-l" "g g" 'magit-status)
(personal/bind-key "C-l" "g b" 'vc-annotate)
(personal/bind-key "C-l" "g p" 'yagist-region-or-buffer)

(personal/bind-key "C-l" "w b" 'personal/trim-backwards)
(personal/bind-key "C-l" "w f" 'personal/trim-forwards)
(personal/bind-key "C-l" "w a" 'personal/trim-backwards-and-forwards)
(personal/bind-key "C-l" "w t" 'delete-trailing-whitespace)
(personal/bind-key "C-l" "w w" 'fixup-whitespace)
(personal/bind-key "C-l" "SPC" 'personal/fix-all-whitespace)

(personal/bind-key "C-l" "b l" 'linum-mode)

(personal/bind-key "C-l" "o r" 'inf-ruby)
(personal/bind-key "C-l" "o R" 'personal/rails-console)
(personal/bind-key "C-l" "o d" 'personal/rails-dbconsole)
(personal/bind-key "C-l" "o s" 'personal/open-shell-in-ansi-term)
(personal/bind-key "C-l" "o m" 'man)
(personal/bind-key "C-l" "o c" 'calc)
(personal/bind-key "C-l" "o l" 'ielm)
(personal/bind-key "C-l" "o i" 'personal/erc-connect)

;; Allow - to go up a directory in dired (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)
