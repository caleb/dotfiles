;;; snippets.el --- Settings for snippets

;;; Commentary:

;; Settings for snippets

;;; Code:

(setq yas-snippet-dirs
      (list (expand-file-name "personal/snippets" user-emacs-directory)
            ))

(yas-global-mode)

(setq yas-prompt-functions '(yas/ido-prompt))

;;; snippets.el ends here
