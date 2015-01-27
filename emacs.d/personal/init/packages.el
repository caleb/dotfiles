(prelude-require-packages '(
                            ag
                            aggressive-indent
                            chruby
                            color-theme-sanityinc-tomorrow
                            nginx-mode
                            evil-args
                            evil-jumper
                            evil-matchit
                            evil-nerd-commenter
                            fill-column-indicator
                            flycheck-rust
                            gruvbox-theme
                            helm-ag
                            js2-refactor
                            monokai-theme
                            multiple-cursors
                            nlinum
                            nyan-mode
                            paredit
                            projectile-rails
                            rhtml-mode
                            ruby-compilation
                            rust-mode
                            smartrep
                            solarized-theme
                            toggle-quotes
                            window-number
                            yagist
                            yasnippet
                            ))

;; vendored packages
(personal/load-init-file "personal/vendor/rcodetools")
(personal/load-init-file "personal/vendor/scad-mode")
(personal/load-init-file "personal/vendor/smartrep")
