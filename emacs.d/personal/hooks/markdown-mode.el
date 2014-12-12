;; show wrap guide and use soft wrap
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
(fci-mode)

(setq fill-column personal-wrap-limit)
(longlines-mode)

(local-set-key (kbd "C-l b w") 'personal/toggle-wrap)

;; show junk whitespace
(whitespace-mode)

;; activate character pairing
(smartparens-mode)

(sp-with-modes (list major-mode)
  (sp-local-pair "`" "`"))

;; command shortcuts
(local-set-key (kbd "C-l `")   'personal/insert-fenced-code-block)
(local-set-key (kbd "C-l o p") 'personal/markdown-preview)

;; limit the spell checking activated by text-mode
(setq flyspell-generic-check-word-predicate 'personal/markdown-mode-flyspell-verify)
