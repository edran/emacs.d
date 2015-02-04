(require 'cc-mode)
(setq-default
 c-basic-offset 2
 c-default-style "google")

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(require 'cmake-project)

;; Sigh.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c++-mode-hook
          (lambda () (setq comment-start "/* " comment-end " */")))


;; ########### CMAKE fixes

(defun maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

(require 'cmake-mode)
(setq auto-mode-alist
        (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist))


;; ########### cpputils
(require 'cpputils-cmake)
(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))
(global-set-key (kbd "C-c C-g")
 '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
(setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include"
                                              "-DNDEBUG"
                                              "-I/opt/ros/hydro/include"))
(setq cppcm-write-flymake-makefile nil)
