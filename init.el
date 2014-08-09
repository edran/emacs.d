;; (server-start)

(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/vendor")
(setq custom-file "~/.emacs.d/lisp/secrets.el")
(load custom-file)
(load  "~/.emacs.d/lisp/local-config.el")
