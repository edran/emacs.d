(require 'cc-mode)
(setq-default c-basic-offset 2 c-default-style "google")

;; (setq-default tab-width 2 indent-tabs-mode t)
;; (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; (add-to-list 'ac-sources 'ac-source-semantic) 
;; (add-to-list 'ac-sources 'ac-source-gtags)

;; (add-hook 'c-mode-hook
;;           (defun my-c-mode-hook ()
;;             (auto-complete-mode)
;;             (setq ac-sources '(ac-source-semantic))
;;             (ac-complete-semantic)))
