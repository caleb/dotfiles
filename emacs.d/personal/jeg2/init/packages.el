;; Idea from Ryan Davis:
;; http://blog.zenspider.com/blog/2013/06/my-emacs-setup-packages.html

(require 'package)

(dolist (repo '(("elpa"      . "http://tromey.com/elpa/")
                ("marmalade" . "http://marmalade-repo.org/packages/")
                ("melpa"     . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives repo))

(defun personal/package-refresh-and-install (name)
  "Ensure we have a fresh package list, then install."
  (package-refresh-contents)
  (package-install name))

(defun personal/package-install-unless-installed (name)
  "Install a package by name unless it is already installed."
  (or (package-installed-p name) (personal/package-refresh-and-install name)))

(defun personal/package-details-for (name)
  "Safely pull out package details across Emacs versions."
  (let ((v (cdr (assoc name package-archive-contents))))
    (and v (if (consp v)
               (car v) ; for Emacs 24.4+
             v))))

(defun personal/package-version-for (package)
  "Get the version of a loaded package."
  (package-desc-vers (personal/package-details-for package)))

(defun personal/package-delete-by-name (package)
  "Remove a package by name."
  (package-delete (symbol-name package)
                  (package-version-join (personal/package-version-for package))))

(defun personal/package-delete-unless-listed (packages)
  "Remove packages not explicitly declared."
  (let ((packages-and-dependencies (personal/packages-requirements packages)))
    (dolist (package (mapcar 'car package-alist))
      (unless (memq package packages-and-dependencies)
        (personal/package-delete-by-name package)))))

(defun personal/packages-requirements (packages)
  "List of dependencies for packages."
  (delete-dups (apply 'append (mapcar 'personal/package-requirements packages))))

(defun personal/package-requirements (package)
  "List of recursive dependencies for a package."
  (let ((package-info (personal/package-details-for package)))
     (cond ((null package-info) (list package))
           (t
            (personal/flatten
             (cons package
                   (mapcar 'personal/package-requirements
                           (mapcar 'car (package-desc-reqs package-info)))))))))

(defun personal/package-install-and-remove-to-match-list (&rest packages)
  "Sync packages so the installed list matches the passed list."
  (package-initialize)
  (condition-case nil ;; added to handle no-network situations
      (mapc 'personal/package-install-unless-installed packages)
    (error (message "Couldn't install package. No network connection?")))
  (personal/package-delete-unless-listed packages))

(personal/package-install-and-remove-to-match-list
 'ag
 'coffee-mode
 'color-theme-sanityinc-tomorrow
 'dart-mode
 'dash
 'evil
 'evil-args
 'evil-jumper
 'evil-matchit
 'evil-nerd-commenter
 'evil-surround
 'expand-region
 'fill-column-indicator
 'haml-mode
 'idomenu
 'inf-ruby
 'js2-mode
 'js2-refactor
 'magit
 'markdown-mode
 'multiple-cursors
 'paredit
 'rainbow-mode
 'rhtml-mode
 'ruby-compilation
 'rust-mode
 's
 'scss-mode
 'smartparens
 'undo-tree
 'window-number
 'yagist
 'yaml-mode
 'yasnippet
 )

;; vendored packages
(personal/load-init-file "personal/vendor/rcodetools")
(personal/load-init-file "personal/vendor/scad-mode")
