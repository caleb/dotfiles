;;; markdown.el --- Configures the modeline

;;; Commentary:

;; Configures the modeline

;;; Code:

(column-number-mode 1)
(size-indication-mode -1)

(setq display-time-day-and-date t
      display-time-24hr-format  t)
(display-time)

(defun personal/flycheck-mode-line-status-text (&optional status)
  "Get a text describing STATUS for use in the mode line.

STATUS defaults to `flycheck-last-status-change' if omitted or
nil."
  (let ((text (pcase (or status flycheck-last-status-change)
                (`not-checked "")
                (`no-checker "-")
                (`running "*")
                (`errored "!")
                (`finished
                 (if flycheck-current-errors
                     (let-alist (flycheck-count-errors flycheck-current-errors)
                       (format ":%s/%s" (or .error 0) (or .warning 0)))
                   ""))
                (`interrupted "-")
                (`suspicious "?"))))
    (concat " Φ" text)))

;; Clean up the FlyCheck mode line to save some charset
(setq flycheck-mode-line '(:eval (personal/flycheck-mode-line-status-text)))

;; Clean up other mode line items
(defvar personal/mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (yas/minor-mode . " υ")
    (yas-minor-mode . " υ")
    (paredit-mode . " π")
    (god-mode . "")
    (god-local-mode . "")
    (guru-mode . "")
    (guru-global-mode . "")
    (whitespace-mode . "")
    (helm-mode . "")
    (global-company-mode . "")
    (company-mode . "")
    (prelude-mode . "")

    ;; Major modes
    (lisp-interaction-mode . "λ")
    (python-mode . "Py")
    (emacs-lisp-mode . "EL")
    (nxhtml-mode . "nx"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun personal/clean-mode-line ()
  (interactive)
  (loop for cleaner in personal/mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'personal/clean-mode-line)

;;; alias the new `flymake-report-status-slim' to
;;; `flymake-report-status'
(defalias 'flymake-report-status 'flymake-report-status-slim)
(defun flymake-report-status-slim (e-w &optional status)
  "Show \"slim\" flymake status in mode line."
  (when e-w
    (setq flymake-mode-line-e-w e-w))
  (when status
    (setq flymake-mode-line-status status))
  (let* ((mode-line " Φ"))
    (when (> (length flymake-mode-line-e-w) 0)
      (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
    (setq mode-line (concat mode-line flymake-mode-line-status))
    (setq flymake-mode-line mode-line)
    (force-mode-line-update)))

;;
;; Mode Line Configuration
;;
(setq sml/no-confirm-load-theme t)
(setq sml/read-only-char " RO ")
(setq sml/modified-char " ** ")
(setq sml/outside-modified-char " MM ")
(setq sml/mule-info nil)

(defface personal/mode-line-evil-mode-insert '((t :inverse-video nil)) "Face for evil insert mode" :group 'personal/faces)
(defface personal/mode-line-evil-mode-emacs  '((t :inverse-video nil)) "Face for evil emacs mode" :group 'personal/faces)
(defface personal/mode-line-evil-mode-normal '((t :inverse-video nil)) "Face for evil normal mode" :group 'personal/faces)
(defface personal/mode-line-evil-mode-visual '((t :inverse-video nil)) "Face for evil visual mode" :group 'personal/faces)
(defface personal/mode-line-evil-mode-none   '((t :inverse-video nil)) "Face for evil none mode" :group 'personal/faces)

(setq mode-line-format (list "%e"
                             '(:eval (cond ((evil-insert-state-p) (propertize " INSERT " 'face 'personal/mode-line-evil-mode-insert))
                                           ((evil-emacs-state-p)  (propertize " EMACS  " 'face 'personal/mode-line-evil-mode-emacs))
                                           ((evil-visual-state-p) (propertize " VISUAL " 'face 'personal/mode-line-evil-mode-visual))
                                           ((evil-normal-state-p) (propertize " NORMAL " 'face 'personal/mode-line-evil-mode-normal))
                                           (t                     (propertize "        " 'face 'personal/mode-line-evil-mode-none))))

                             'mode-line-front-space

                             'mode-line-mule-info
                             'mode-line-client
                             'mode-line-modified
                             'mode-line-remote
                             'mode-line-frame-identification
                             'mode-line-buffer-identification
                             "   "
                             'mode-line-position
                             '(vc-mode vc-mode)
                             "  "
                             'mode-line-modes
                             'mode-line-misc-info
                             'mode-line-end-spaces))

(setq sml/theme 'gruvbox)
(sml/setup)

;;; modeline.el ends here
