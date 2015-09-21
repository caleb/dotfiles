;; adjust spacing
(set (make-local-variable 'tab-width) 2)

;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-l b w") 'fci-mode)

;; show junk whitespace
(whitespace-mode)

;; activate character pairing
(smartparens-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-l b s") 'personal/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-l t s") 'toggle-quotes)
