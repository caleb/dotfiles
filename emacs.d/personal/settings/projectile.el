;;; projectile.el --- Settings for projectile

;;; Commentary:

;; Settings for projectile

;;; Code:

;; Enable projectile-rails
(setq projectile-rails-keymap-prefix (kbd "C-l p r"))
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;;; projectile.el ends here
