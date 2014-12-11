;; Integrate with Mac OS X's pasteboard.  Inspried by:
;; https://gist.github.com/the-kenny/267162
(defvar personal-pbpaste-executable (executable-find "pbpaste")
  "The pbpaste executable")

(defvar personal-pbcopy-executable (executable-find "pbcopy")
  "The pbcopy executable")

(defun personal/pbpaste ()
  (shell-command-to-string personal-pbpaste-executable))

(defun personal/pbcopy (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" personal-pbcopy-executable)))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function   'personal/pbcopy)
(setq interprogram-paste-function 'personal/pbpaste)
