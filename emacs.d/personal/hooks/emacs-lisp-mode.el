(local-set-key (kbd "C-c f") 'sp-forward-slurp-sexp)
(local-set-key (kbd "C-c F") 'sp-forward-barf-sexp)

;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-l b w") 'fci-mode)

;; show junk whitespace
(whitespace-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-l b s") 'personal/toggle-program-spelling)
