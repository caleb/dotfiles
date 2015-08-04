(prelude-require-packages '(
                            ag
                            aggressive-indent
                            bats-mode
                            chruby
                            editorconfig
                            ember-mode
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
                            handlebars-mode
                            helm-ag
                            js2-refactor
                            multiple-cursors
                            nginx-mode
                            nlinum
                            nyan-mode
                            paredit
                            projectile-rails
                            rhtml-mode
                            ruby-compilation
                            rust-mode
                            toggle-quotes
                            window-jump
                            window-number
                            yagist
                            yasnippet
                            ))

;; vendored packages
(personal/load-init-file "personal/vendor/rcodetools")
(personal/load-init-file "personal/vendor/scad-mode")
