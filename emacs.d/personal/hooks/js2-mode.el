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
(local-set-key (kbd "C-l =") 'personal/align=)
(local-set-key (kbd "C-l ;") 'personal/close-statement)

(local-set-key (kbd "C-l t s") 'personal/toggle-string-type)

;; js2-refactor
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-l C-l r")
