;;; hs-minor-mode.el --- Customize hs-minor-mode

;;; Commentary:

;; Some basic configuration for Elixir development.

;;; Code:

(personal/bind-key "C-l" "z M-c" 'hs-hide-all)
(personal/bind-key "C-l" "z M-o" 'hs-show-all)

(personal/bind-key "C-l" "z c" 'hs-hide-block)
(personal/bind-key "C-l" "z o" 'hs-show-block)
(personal/bind-key "C-l" "z a" 'hs-toggle-hiding)

;;; hs-minor-mode.el ends here
