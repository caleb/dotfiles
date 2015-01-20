;;; extensions.el --- Settings related to file extensions

;;; Commentary:

;; Settings related to file extensions

;;; Code:

;; Markdown
(add-to-list 'auto-mode-alist '("\\.markdn\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown\\'"  . markdown-mode))

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'"         . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'"        . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"        . js2-mode))
(add-to-list 'auto-mode-alist '("\\.browserify\\'" . js2-mode))

;; CoffeeScript
(add-to-list 'auto-mode-alist '("\\.cjsx\\'"       . coffee-mode))

;;; extensions.el ends here
