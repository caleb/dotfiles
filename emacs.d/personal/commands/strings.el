;;;###autoload
(defun personal/toggle-string-type ()
  "Toggle between double, single, and choose-your-own-quotes string types."
  (interactive)
  (let ((regex (concat "\\`\\(?:"
                       "\"\\(?:\\\\\\\\\\|\\\\\.\\|[^\"\\]+\\)*\""
                       "\\|"
                       "'\\(?:\\\\\\\\\\|\\\\\.\\|[^'\\]+\\)*'"
                       (if (not (or (eq major-mode 'js-mode)
                                    (eq major-mode 'js2-mode)))
                           (concat "\\|"
                                   "%Q{.*}"  ; FIXME:  sometimes fails
                                   )
                         "")
                       "\\)\\'")))
    (while (or (not (region-active-p))
               (not (or (and (= (point-min) (region-beginning))
                             (= (point-max) (region-end)))
                        (string-match regex (buffer-substring-no-properties
                                             (region-beginning)
                                             (region-end))))))
      (let ((expand-region-fast-keys-enabled))
        (er/expand-region 1)))
    (let ((matched (buffer-substring-no-properties (region-beginning)
                                                   (region-end))))
      (if (string-match regex matched)
          (cond ((and (not (or (eq major-mode 'js-mode)
                               (eq major-mode 'js2-mode)))
                      (string= (substring matched 0 1) "\""))
                 (call-interactively 'backward-delete-char-untabify)
                 (let ((old_point (point)))
                   (insert (concat "%Q{"
                                   (personal/regex-replace-all
                                    (substring matched 1 -1)
                                    "\\\\\""
                                    "\"")
                                   "}"))
                   (goto-char (+ old_point 3))))
                ((string= (substring matched 0 1) "\"")
                 (call-interactively 'backward-delete-char-untabify)
                 (let ((old_point (point)))
                   (insert (concat "'"
                                   (personal/regex-replace (substring matched 1 -1)
                                                           "'"
                                                           "\\\\'")
                                   "'"))
                   (goto-char (+ old_point 1))))
                ((string= (substring matched 0 1) "'")
                 (call-interactively 'backward-delete-char-untabify)
                 (let ((old_point (point)))
                   (insert (concat "\""
                                   (personal/regex-replace-all
                                    (personal/regex-replace-all (substring matched
                                                                           1
                                                                           -1)
                                                                "\\\\\'"
                                                                "'")
                                    "\""
                                    "\\\\\"")
                                   "\""))
                   (goto-char (+ old_point 1))))
                ((string= (substring matched 0 3) "%Q{")
                 (call-interactively 'backward-delete-char-untabify)
                 (let ((old_point (point)))
                   (insert (concat "'"
                                   (personal/regex-replace (substring matched 3 -1)
                                                           "'"
                                                           "\\\\'")
                                   "'"))
                   (goto-char (+ old_point 1)))))))))
