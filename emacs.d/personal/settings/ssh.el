;;; ssh.el --- Settings for ssh

;;; Commentary:

;; Settings for ssh

;;; Code:

;; configure tramp
(require 'tramp)
(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

;;; ssh.el ends here
