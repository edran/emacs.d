;; (server-start)

(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(load "~/.emacs.d/lisp/secrets.el")

(load  "~/.emacs.d/lisp/local-config.el")
