(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-l b w") 'fci-mode)

;; show junk whitespace
(whitespace-mode)

;; activate character pairing
(smartparens-mode)

(setq web-mode-enable-auto-pairing nil) ; Disable web-mode auto pairing

; Set up smart parens auto pairing
(defun sp-web-mode-is-code-context (id action context)
  (when (and (eq action 'insert)
             (not (or (get-text-property (point) 'part-side)
                      (get-text-property (point) 'block-side))))

    t))

(sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-l b s") 'personal/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-l =") 'personal/align=)
(local-set-key (kbd "C-l ;") 'personal/close-statement)

(local-set-key (kbd "C-l t s") 'toggle-quotes)
