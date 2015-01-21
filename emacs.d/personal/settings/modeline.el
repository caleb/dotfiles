;;; markdown.el --- Configures the modeline

;;; Commentary:

;; Configures the modeline

;;; Code:

(column-number-mode 1)

(setq display-time-day-and-date t
      display-time-24hr-format  t)
(display-time)

;; Setup Smart Mode Line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'dark)

(setq rm-blacklist '(" ws" " Helm" " guru" " Fly" " company" " Pre" " SP/s" " SP"))

(setq rm-text-properties
      '(("\\` GOD\\'" 'face 'font-lock-keyword-face)))

;; Change the mode-line in god mode
(defun personal/god-mode-mode-line ()
  "Set the mode line to indicate whether god-mode is enabled."
  (if god-local-mode
      (progn (set-face-background 'mode-line "#1d2021"))
    (progn (set-face-background 'mode-line "#5f0000"))))

(add-hook 'god-mode-enabled-hook 'personal/god-mode-mode-line)
(add-hook 'god-mode-disabled-hook 'personal/god-mode-mode-line)


;; Clean up the projectile mode line
(setq projectile-mode-line '(:eval (format " P[%s]" (projectile-project-name))))

;; Clean up other mode line items
(defvar personal/mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (yas/minor-mode . " υ")
    (yas-minor-mode . " υ")
    (paredit-mode . " π")
    (god-mode . " GOD")
    (god-mode-all . " GOD")
    (god-local-mode . " GOD")

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

;;; modeline.el ends here
