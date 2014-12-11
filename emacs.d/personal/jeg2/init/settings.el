(defun personal/load-settings ()
  "Loads all Lisp files in the settings subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "personal/settings")
                                 nil
                                 "\\.el$"))
    (personal/load-init-file (concat "personal/settings/" file))))

(personal/load-settings)
