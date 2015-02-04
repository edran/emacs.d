;;; package --- Summary: : Loaded from init file
;;; Commentary:

;; Theme loading
(load "~/.emacs.d/vendor/themes/theme.el")
;;; Code:

;; Let's use some global variables
;; (setq vendor-path "~/.emacs.d/vendor/")
;; (setq config-path "~/.emacs.d/config/")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plugins

(load "~/.emacs.d/lisp/config/packages.el")
;; (load "~/.emacs.d/lisp/nlinum-relative.el")

(load "~/.emacs.d/lisp/config/ag.el")
;; (load "~/.emacs.d/lisp/config/auto-complete.el")
;; (load "~/.emacs.d/lisp/config/autopair.el")
(load "~/.emacs.d/lisp/config/cc-mode.el")

(load "~/.emacs.d/lisp/config/dired.el")
(load "~/.emacs.d/lisp/config/deft.el")
(load "~/.emacs.d/lisp/config/ecb.el")
(load "~/.emacs.d/lisp/config/edit-server.el")
(load "~/.emacs.d/lisp/config/emacs-lisp-mode.el")
(load "~/.emacs.d/lisp/config/eshell-mode.el")
(load "~/.emacs.d/lisp/config/expand-region.el")
(load "~/.emacs.d/lisp/config/company.el")
(load "~/.emacs.d/lisp/config/flycheck.el")
(load "~/.emacs.d/lisp/config/god-mode.el")
(load "~/.emacs.d/lisp/config/guide-key.el")
;; (load "~/.emacs.d/lisp/config/guru-mode.el")
(load "~/.emacs.d/lisp/config/haskell-mode.el")
(load "~/.emacs.d/lisp/config/ido-mode.el")
(load "~/.emacs.d/lisp/config/iedit.el")
(load "~/.emacs.d/lisp/config/indent.el")
(load "~/.emacs.d/lisp/config/ispell.el")
(load "~/.emacs.d/lisp/config/key-chord.el")
(load "~/.emacs.d/lisp/config/magit.el")
(load "~/.emacs.d/lisp/config/markdown-mode.el")
(load "~/.emacs.d/lisp/config/org-mode.el")
(load "~/.emacs.d/lisp/config/projectile.el")
(load "~/.emacs.d/lisp/config/python-mode.el")
;; (load "~/.emacs.d/lisp/config/smartparens.el")
(load "~/.emacs.d/lisp/config/tex-mode.el")
(load "~/.emacs.d/lisp/config/tramp-mode.el")
(load "~/.emacs.d/lisp/config/web-mode.el")
(load "~/.emacs.d/lisp/config/yasnippet.el")
;; (load "~/.emacs.d/lisp/config/ycmd.el")
(load "~/.emacs.d/lisp/config/erc-mode.el")
(load "~/.emacs.d/lisp/config/irony.el")

;; (bind to C-o maybe?)
;; (load "~/.emacs.d/config/fill-column-indicator.el")
;; (load "~/.emacs.d/config/rosemacs.el")

(load "~/.emacs.d/lisp/config/general.el")
(load "~/.emacs.d/lisp/config/look.el")
(load "~/.emacs.d/lisp/config/navigation.el")
(load "~/.emacs.d/lisp/config/diminish.el")
(deft)
