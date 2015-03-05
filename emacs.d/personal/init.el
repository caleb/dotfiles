;; Caleb's Emacs configuration

(defun personal/load-init-file (path &optional noerror)
  "This loads a file from inside the the .emacs.d directory"
  (let ((file (file-name-sans-extension
               (expand-file-name path user-emacs-directory))))
    (load file noerror)))

;; load configuration settings by type
(personal/load-init-file "personal/init/system")
(personal/load-init-file "personal/init/autoloads")
(personal/load-init-file "personal/init/packages")
(personal/load-init-file "personal/init/autohooks")
(personal/load-init-file "personal/init/themes")
(personal/load-init-file "personal/init/settings")
