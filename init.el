;; (server-start)

(let ((default-directory "~/.emacs.d/vendor/"))
 (normal-top-level-add-subdirs-to-load-path))
;; (add-to-list 'load-path "~/.emacs.d/vendor")
(setq custom-file "~/.emacs.d/lisp/customs.el")
(load custom-file)
(load  "~/.emacs.d/lisp/local-config.el")
(put 'set-goal-column 'disabled nil)
