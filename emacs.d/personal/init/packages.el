(prelude-require-packages '(
                            ag
                            aggressive-indent
                            bats-mode
                            chruby
                            color-theme-sanityinc-tomorrow
                            editorconfig
                            evil-args
                            evil-exchange
                            evil-jumper
                            evil-matchit
                            evil-nerd-commenter
                            evil-smartparens
                            fill-column-indicator
                            flycheck-rust
                            frame-cmds
                            gruvbox-theme
                            helm-ag
                            js2-refactor
                            monokai-theme
                            multiple-cursors
                            nginx-mode
                            nlinum
                            nyan-mode
                            paredit
                            php-mode
                            projectile-rails
                            rhtml-mode
                            ruby-compilation
                            rust-mode
                            solarized-theme
                            smart-mode-line
                            toggle-quotes
                            window-jump
                            window-number
                            yagist
                            yasnippet
                            ))

;; vendored packages
(personal/load-init-file "personal/vendor/rcodetools")
(personal/load-init-file "personal/vendor/scad-mode")
