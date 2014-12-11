;; show wrap guide
(require 'fill-column-indicator)
(setq fci-rule-column personal-wrap-limit)
(fci-mode)

(local-set-key (kbd "C-c v w") 'fci-mode)

;; show junk whitespace
(whitespace-mode)

;; activate character pairing
(smartparens-mode)

(sp-with-modes (list major-mode)
  (sp-local-pair "'" nil :actions '(:rem insert))
  ;; (sp-local-pair "'" nil :unless '(:add personal/sp-in-rust-mode))
  ; pair for generics and lifetimes, but not comparisons
  (sp-local-pair "<" ">" :when '(sp-point-after-word-p)))

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'personal/toggle-program-spelling)

;; configure compilation
(set (make-local-variable 'compile-command)
     (concat "rustc " buffer-file-name))
(set (make-local-variable 'compilation-read-command)
     nil)

;; command shortcuts
(local-set-key (kbd "C-c c") 'compile)

(local-set-key (kbd "C-M-n") 'personal/other-window-next-line)
(local-set-key (kbd "C-M-p") 'personal/other-window-previous-line)

(local-set-key (kbd "C-c =") 'personal/align=)

(local-set-key (kbd "C-c t s") 'personal/toggle-string-type)
