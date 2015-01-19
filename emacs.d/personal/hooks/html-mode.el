(hs-minor-mode)

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
(local-set-key (kbd "C-l RET") 'personal/newline-between)  ; an override

(local-set-key (kbd "C-l <") 'personal/html-insert-open-and-close-tag)
(local-set-key (kbd "C-l >") 'personal/erb-insert-or-toggle-erb-tag)
