(prelude-require-packages '(ag
                            helm-ag
                            color-theme-sanityinc-tomorrow
                            gruvbox-theme
                            solarized-theme
                            evil-args
                            evil-jumper
                            evil-matchit
                            evil-nerd-commenter
                            fill-column-indicator
                            js2-refactor
                            paredit
                            multiple-cursors
                            rhtml-mode
                            ruby-compilation
                            window-number
                            yagist
                            yasnippet))

;; vendored packages
(personal/load-init-file "personal/vendor/rcodetools")
(personal/load-init-file "personal/vendor/scad-mode")