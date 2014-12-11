;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-c v w") 'fci-mode)

;; show junk whitespace
(whitespace-mode)

;; activate character pairing
(smartparens-mode)

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'personal/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-c RET") 'personal/newline-between)  ; an override

(local-set-key (kbd "C-c <") 'personal/html-insert-open-and-close-tag)
(local-set-key (kbd "C-c >") 'personal/erb-insert-or-toggle-erb-tag)
