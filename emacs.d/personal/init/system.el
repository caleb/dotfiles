;; Idea from Ryan Davis:
;; http://blog.zenspider.com/blog/2013/06/my-emacs-setup-osx.html

;; load OS specific settings
(personal/load-init-file (concat "personal/system/" (symbol-name system-type)) t)

;; load system specific settings
(personal/load-init-file (concat "personal/system/"
                             (downcase (car (split-string (system-name) "\\."))))
                     t)

;; load minimal early system settings
(personal/load-init-file "personal/system/minimal.el")
