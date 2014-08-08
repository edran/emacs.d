(require 'cc-mode)
(setq-default c-basic-offset 2 c-default-style "google")

;; (setq-default tab-width 2 indent-tabs-mode t)
;; (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(require 'cmake-project)
;; (add-to-list 'ac-sources 'ac-source-semantic) 
;; (add-to-list 'ac-sources 'ac-source-gtags)

;; (add-hook 'c-mode-hook
;;           (defun my-c-mode-hook ()
;;             (auto-complete-mode)
;;             (setq ac-sources '(ac-source-semantic))
;;             (ac-complete-semantic)))

; Add cmake listfile names to the mode list.
(require 'cmake-project)

(defun maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

(require 'cmake-mode)
(setq auto-mode-alist
        (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))     
                auto-mode-alist))

