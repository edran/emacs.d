(with-no-warnings
  (require 'cl-lib))
;; (server-start)

(let ((default-directory "~/.emacs.d/vendor/"))
 (normal-top-level-add-subdirs-to-load-path))

(setq custom-file "~/.emacs.d/lisp/customs.el")
(load custom-file)
(load  "~/.emacs.d/lisp/local-config.el")
