(defun personal/load-themes ()
  "Loads all Lisp files in the themes subdirectory of the init directory."
  (dolist (file (directory-files (concat user-emacs-directory "personal/themes")
                                 nil
                                 "\\.el$"))
    (personal/load-init-file (concat "personal/themes/" file))))

(personal/load-themes)
