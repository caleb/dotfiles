(setq js2-basic-offset 2)

(hs-minor-mode)

(when (and (stringp buffer-file-name)
           (string-match "\\.jsx\\'" buffer-file-name))
  (aggressive-indent-mode -1))

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

(local-set-key (kbd "C-l t s") 'toggle-quotes)

;; Include node globals to prevent warnings about undeclared functions/variables
;; (e.g. require/module)
(setq js2-include-node-externs t)

;; js2-refactor
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-l C-r r")
