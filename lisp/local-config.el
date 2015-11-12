;; Generic
(load "~/.emacs.d/lisp/config/general.el")
(load "~/.emacs.d/lisp/config/look.el")
(load "~/.emacs.d/lisp/config/navigation.el")

;; Tools
(load "~/.emacs.d/lisp/config/eshell-mode.el")
(load "~/.emacs.d/lisp/config/helm-mode.el")
(load "~/.emacs.d/lisp/config/god-mode.el")

;; Programming
(load "~/.emacs.d/lisp/config/magit.el")
(load "~/.emacs.d/lisp/config/company.el")
(load "~/.emacs.d/lisp/config/flycheck.el")

;; Languages
(load "~/.emacs.d/lisp/config/cc-mode.el")
(load "~/.emacs.d/lisp/config/emacs-lisp-mode.el")
(load "~/.emacs.d/lisp/config/markdown-mode.el")
(load "~/.emacs.d/lisp/config/org-mode.el")
(load "~/.emacs.d/lisp/config/python-mode.el")
(load "~/.emacs.d/lisp/config/lua-mode.el")
(load "~/.emacs.d/lisp/config/tex-mode.el")


(load "~/.emacs.d/lisp/config/diminish.el")
(deft)
(provide 'local-config)
