;; Markdown
(add-to-list 'auto-mode-alist '("\\.markdn\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown\\'"  . markdown-mode))

;; Ruby
(add-to-list 'auto-mode-alist '("Rakefile\\'"   . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'"         . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'"        . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"        . js2-mode))
(add-to-list 'auto-mode-alist '("\\.browserify\\'" . js2-mode))
