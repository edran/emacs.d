;; [==:INIT flycheck==]
(add-hook 'after-init-hook 'global-flycheck-mode)
;; (setq flycheck-check-syntax-automatically '(mode-enabled idle-change))
;; 
(require 'flycheck-color-mode-line)
;; (eval-after-load "flycheck"
;;  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(eval-after-load 'flycheck (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
