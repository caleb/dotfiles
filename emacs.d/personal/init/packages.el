(prelude-require-packages '(ag
                            aggressive-indent
                            helm-ag
                            color-theme-sanityinc-tomorrow
                            gruvbox-theme
                            solarized-theme
                            monokai-theme
                            evil-args
                            evil-jumper
                            evil-matchit
                            evil-nerd-commenter
                            fill-column-indicator
                            js2-refactor
                            paredit
                            multiple-cursors
                            nlinum
                            rhtml-mode
                            rust-mode
                            flycheck-rust
                            ruby-compilation
                            smartrep
                            nyan-mode
                            toggle-quotes
                            window-number
                            yagist
                            yasnippet))

;; vendored packages
(personal/load-init-file "personal/vendor/rcodetools")
(personal/load-init-file "personal/vendor/scad-mode")
(personal/load-init-file "personal/vendor/smartrep")
