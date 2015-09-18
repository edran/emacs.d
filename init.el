;; Use common lisp
(with-no-warnings
  (require 'cl-lib))

;; Define some configuration variables
(defvar config-path
  (file-name-as-directory (concat user-emacs-directory "lisp")))
(defvar third-party-path
  (file-name-as-directory (concat user-emacs-directory "vendor")))
(defvar local-config-file
  (concat config-path "local-config.el"))

;; Add third party packages to load path
(let ((default-directory third-party-path))
 (normal-top-level-add-subdirs-to-load-path))

;; Keep custom config in separate file
(setq custom-file
      (expand-file-name "lisp/customs.el" user-emacs-directory))
(load custom-file)

(load local-config-file)
