(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; show wrap guide (this causes problems with web-mode,
;; so it's turned off by default)
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
;; (fci-mode)

(local-set-key (kbd "C-l b w") 'fci-mode)

;; Emacs, by default, wraps lines. The fci-mode above unwraps lines, which is
;; what we want, but since we can't use fci-mode we have to manually turn off
;; wrapping
(toggle-truncate-lines)

;; show junk whitespace
(whitespace-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-l b s") 'personal/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-l ;") 'personal/close-statement)
(local-set-key (kbd "C-l /") 'web-mode-comment-or-uncomment)
(local-set-key (kbd "C-l C-/") 'web-mode-comment-or-uncomment)

(local-set-key (kbd "C-l t s") 'toggle-quotes)
