;;;###autoload
(defun personal/open-shell-in-ansi-term ()
  "Opens a new shell inside an ansi-terminal."
  (interactive)
  (ansi-term "bash" "localhost"))
