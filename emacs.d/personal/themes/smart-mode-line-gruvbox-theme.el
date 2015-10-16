;;; smart-mode-line-gruvbox-theme.el --- Gruvbox for smart-mode-line

;; Copyright (C) 2015 Caleb Land <caleb@land.fm>

;; Author: Caleb Land <caleb@land.fm>
;; URL: http://github.com/caleb/dotfiles
;; Separator: -

;;; License:
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;

;;; Commentary:

;;; Change Log:
;; 0.1a - 2014/05/14 - Created File.
;;; Code:

(custom-theme-set-faces
  'gruvbox
  `(which-func ((t :inherit sml/filename)))

  `(mode-line-buffer-id   ((t :inherit sml/filename
                             :foreground nil
                             :background nil)))

  `(mode-line-inactive    ((t :foreground "gray80"
                             :background "gray30"
                             :inverse-video nil
                             :box (:line-width 6 :color "gray30" :style nil))))

  `(mode-line             ((t :foreground "gray60"
                             :background "gray20"
                             :inverse-video nil
                             :underline nil
                             :box (:line-width 6 :color "gray20" :style nil))))

  `(sml/global            ((t :inverse-video nil)))

  `(sml/modes             ((t :inherit sml/global
                             :foreground "gray80")))

  `(sml/minor-modes       ((t :inherit sml/global
                             :foreground "gray40"
                             :height 130)))

  `(sml/line-number       ((t :height 120
                             :family "Menlo")))

  `(sml/col-number        ((t :height 120
                             :family "Menlo")))

  `(sml/folder            ((t :inherit sml/global
                             :foreground "gray60")))

  `(sml/filename          ((t :inherit sml/global
                             :foreground ,(if (display-graphic-p) "#fe8019" "#ff8700")
                             :weight bold)))

  `(sml/prefix            ((t :inherit sml/global
                             :foreground "#ffaf00")))

  `(sml/process           ((t :inherit sml/proces
                             :foreground "#718c00")))

  `(sml/modified          ((t :inherit sml/not-modified
                             :foreground "#c82829"
                             :background "#ffffff"
                             :box (:line-width 2 :color "#c82829"))))

  `(sml/read-only         ((t :inherit sml/not-modified
                             :foreground ,(if (display-graphic-p) "#83a598" "#87afaf")
                             :box (:line-width 2 :color ,(if (display-graphic-p) "#83a598" "#87afaf")))))

  `(personal/mode-line-evil-mode-normal ((t :inherit sml/global
                                           :box (:line-width 2 :color "transparent"))))

  `(personal/mode-line-evil-mode-visual ((t :inherit sml/global
                                           :box (:line-width 2 :color "transparent"))))

  `(personal/mode-line-evil-mode-none ((t :inherit sml/global
                                         :box (:line-width 2 :color "transparent"))))

  `(personal/mode-line-evil-mode-insert ((t :inherit sml/global
                                           :foreground ,(if (display-graphic-p) "#ffffc8" "color-230")
                                           :background ,(if (display-graphic-p) "#9d0006" "color-88")
                                           :box (:line-width 2 :color "#c82829"))))

  `(personal/mode-line-evil-mode-emacs  ((t :inherit sml/global
                                           :foreground ,(if (display-graphic-p) "#9d0006" "color-88")
                                           :background ,(if (display-graphic-p) "#ffffc8" "color-230")
                                           :box (:line-width 2 :color "#c82829"))))

  `(persp-selected-face   ((t :inherit sml/filename
                             :foreground "ForestGreen")))

  `(helm-candidate-number ((t :inherit sml/filename
                             :foreground nil
                             :background nil))))

(provide 'smart-mode-line-gruvbox-theme)

;;; smart-mode-line-gruvbox-theme.el ends here
