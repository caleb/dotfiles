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
  ; remove pairs I use snippets for
  (sp-local-pair "do"     nil :actions :rem)
  (sp-local-pair "begin"  nil :actions :rem)
  (sp-local-pair "def"    nil :actions :rem)
  (sp-local-pair "class"  nil :actions :rem)
  (sp-local-pair "module" nil :actions :rem)
  (sp-local-pair "case"   nil :actions :rem)
  (sp-local-pair "for"    nil :actions :rem)
  (sp-local-pair "if"     nil :actions :rem)
  (sp-local-pair "unless" nil :actions :rem)
  (sp-local-pair "while"  nil :actions :rem)
  (sp-local-pair "until"  nil :actions :rem))

;; do some spell checking (requires:  brew install aspell --lang=en)
(flyspell-prog-mode)

(local-set-key (kbd "C-c v s") 'personal/toggle-program-spelling)

;; command shortcuts
(local-set-key (kbd "C-M-n") 'personal/other-window-next-line)
(local-set-key (kbd "C-M-p") 'personal/other-window-previous-line)

(local-set-key (kbd "C-c =") 'personal/align=)

(local-set-key (kbd "C-c t s") 'personal/toggle-string-type)

(local-set-key (kbd "C-c t t") 'personal/toggle-ruby-test)
(local-set-key (kbd "C-c t b") 'personal/toggle-ruby-block-type)
(local-set-key (kbd "C-c t r") 'personal/toggle-ruby-regex-type)
(local-set-key (kbd "C-c t S") 'personal/toggle-ruby-string-and-symbol)
(local-set-key (kbd "C-c t h") 'personal/toggle-ruby-hash-type)

(local-set-key (kbd "C-c x") 'xmp)  ; (requires:  gem install rcodetools)
