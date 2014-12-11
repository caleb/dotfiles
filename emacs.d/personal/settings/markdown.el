;; restrict spelling
(setq personal-spelling-skipped-markdown-faces
      '(markdown-pre-face markdown-reference-face markdown-url-face))

(defun personal/markdown-mode-flyspell-verify ()
  "An override used to shut Flyspell of in some parts of Markdown."
  (let ((face (get-text-property (point) 'face)))
    (not (memq face personal-spelling-skipped-markdown-faces))))
