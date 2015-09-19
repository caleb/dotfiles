;;; auto-compile.el --- auto-compile emacs lisp      -*- no-byte-compile: t -*-
(require 'auto-compile)
;; This breaks projectile
;;(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)
