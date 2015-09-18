;; Use common lisp
(with-no-warnings
  (require 'cl-lib))

;; Define some configuration variables
(defvar config-path
  (file-name-as-directory (concat user-emacs-directory "lisp")))
(defvar third-party-path
  (file-name-as-directory (concat user-emacs-directory "vendor")))
(defvar custom-themes-path
  (file-name-as-directory (concat third-party-path "themes")))

;; Add lisp files to load path
(add-to-list 'load-path config-path)
(let ((default-directory config-path))
  (normal-top-level-add-subdirs-to-load-path))

;; Add third party packages to load path
(let ((default-directory third-party-path))
  (normal-top-level-add-subdirs-to-load-path))

;; Add custom themes
(defun add-custom-theme-dir (name)
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory
    (concat custom-themes-path name))))

(mapc 'add-custom-theme-dir
 (directory-files
  (file-name-as-directory
   (concat third-party-path "themes"))))

;; Keep custom config in separate file
(setq custom-file
      (expand-file-name "lisp/customs.el" user-emacs-directory))
(load custom-file)

;; Init packages
(require 'packages)

;; Init local config
(require 'local-config)
