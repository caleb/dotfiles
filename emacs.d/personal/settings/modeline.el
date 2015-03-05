;;; markdown.el --- Configures the modeline

;;; Commentary:

;; Configures the modeline

;;; Code:

(column-number-mode 1)
(size-indication-mode nil)

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

;; (add-hook 'after-change-major-mode-hook 'personal/clean-mode-line)

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

(make-face 'mode-line-evil-mode-insert)
(make-face 'mode-line-evil-mode-emacs)
(make-face 'mode-line-evil-mode-normal)

(setq-default mode-line-format (list "%e"
                                     'mode-line-front-space

                                     '(:eval (cond ((evil-insert-state-p) (propertize " INSERT " 'face 'mode-line-evil-mode-insert))
                                                   ((evil-emacs-state-p)  (propertize " EMACS  " 'face 'mode-line-evil-mode-emacs))
                                                   ((evil-normal-state-p) (propertize " NORMAL " 'face 'mode-line-evil-mode-normal))))

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

(sml/setup)

;; Extra mode line faces
(make-face 'mode-line-80col-face)

;; (setq-default mode-line-format '(; Place the Evil mode indicator

;;                                  (:eval (if god-local-mode (propertize " NORMAL " 'face 'mode-line-god-mode-on)
;;                                           (propertize " INSERT " 'face 'mode-line-god-mode-off)))

;;                                         ; Position, including warning for 80 columns
;;                                  " "
;;                                  (:propertize "%4l:" face mode-line-position-face)
;;                                  (:eval (propertize "%3c" 'face
;;                                                     (if (>= (current-column) 80)
;;                                                         'mode-line-80col-face
;;                                                       'mode-line-position-face)))
;;                                         ; emacsclient [default -- keep?]
;;                                  mode-line-client
;;                                  "  "
;;                                         ; read-only or modified status
;;                                  (:eval
;;                                   (cond (buffer-read-only
;;                                          (propertize " RO " 'face 'mode-line-read-only-face))
;;                                         ((buffer-modified-p)
;;                                          (propertize " ** " 'face 'mode-line-modified-face))
;;                                         (t "      ")))
;;                                  "    "
;;                                         ; directory and buffer/file name
;;                                  (:propertize (:eval (personal/shorten-directory default-directory 30))
;;                                               face mode-line-folder-face)
;;                                  (:propertize "%b" face mode-line-filename-face)
;;                                         ; narrow [default -- keep?]
;;                                  " %n "
;;                                         ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
;;                                  (vc-mode vc-mode)
;;                                  "  %["
;;                                  (:propertize mode-name face mode-line-mode-face)
;;                                  "%] "
;;                                  (:eval (propertize (format-mode-line minor-mode-alist)
;;                                                     'face 'mode-line-minor-mode-face))
;;                                  "  "
;;                                  (:propertize mode-line-process face mode-line-process-face)
;;                                  (global-mode-string global-mode-string)
;;                                  "    "
;;                                         ; nyan-mode uses nyan cat as an alternative to %p
;;                                  (:eval (when nyan-mode (list (nyan-create))))))

;; Reconfigure our faces
(set-face-attribute 'mode-line nil
                    :foreground "gray60" :background "gray20"
                    :inverse-video nil
                    :underline nil
                    :box '(:line-width 6 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
                    :foreground "gray80" :background "gray30"
                    :inverse-video nil
                    :box '(:line-width 6 :color "gray30" :style nil))

(set-face-attribute 'mode-line-evil-mode-insert nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#fabd2f" "#ffaf00")
                    :box '(:line-width 2 :color "transparent"))

(set-face-attribute 'mode-line-evil-mode-emacs nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#fabd2f" "#ffaf00")
                    :box '(:line-width 2 :color "transparent"))

(set-face-attribute 'mode-line-evil-mode-normal nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#fabd2f" "#ffaf00")
                    :box '(:line-width 2 :color "transparent"))

(set-face-attribute 'mode-line-god-mode-on nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#fabd2f" "#ffaf00")
                    :box '(:line-width 2 :color "transparent"))

(set-face-attribute 'mode-line-god-mode-off nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#ffffc8" "color-230")
                    :background (if (display-graphic-p) "#9d0006" "color-88")
                    :box '(:line-width 2 :color "#c82829"))

(set-face-attribute 'mode-line-read-only-face nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#83a598" "#87afaf")
                    :box '(:line-width 2 :color (if (display-graphic-p) "#83a598" "#87afaf")))
(set-face-attribute 'mode-line-modified-face nil
                    :inherit 'mode-line-face
                    :foreground "#c82829"
                    :background "#ffffff"
                    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
                    :inherit 'mode-line-face
                    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
                    :inherit 'mode-line-face
                    :foreground (if (display-graphic-p) "#fe8019" "#ff8700")
                    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
                    :inherit 'mode-line-face
                    :family "Menlo" :height 120)
(set-face-attribute 'mode-line-mode-face nil
                    :inherit 'mode-line-face
                    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
                    :inherit 'mode-line-mode-face
                    :foreground "gray40"
                    :height 130)
(set-face-attribute 'mode-line-process-face nil
                    :inherit 'mode-line-face
                    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
                    :inherit 'mode-line-position-face
                    :foreground "black" :background "#eab700")

;;; modeline.el ends here
