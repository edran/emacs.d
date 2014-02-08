;;; package --- Summary: : Loaded from init file
;;; Commentary:

;; Theme loading

(load "~/.emacs.d/vendor/themes/theme.el")
;;; Code:

;; Let's use some global variables
(setq vendor-path "~/.emacs.d/vendor/")
(setq config-path "~/.emacs.d/config/")

(load "~/.emacs.d/config/general.el")
(load "~/.emacs.d/config/look.el")
(load "~/.emacs.d/config/navigation.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plugins

(load "~/.emacs.d/config/packages.el")

(load "~/.emacs.d/config/haskell-mode.el")
(load "~/.emacs.d/config/flycheck.el")
(load "~/.emacs.d/config/auto-complete.el")
(load "~/.emacs.d/config/tex-mode.el")
(load "~/.emacs.d/config/ispell.el")
;;; local-config.el ends here

