(require 'flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)
;; (setq flycheck-check-syntax-automatically '(mode-enabled idle-change))
;; 
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; Disable annoying documentation warnings for lisp code
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(add-hook 'python-mode-hook 'flycheck-mode)
;; run pylint --rcfile=~/.emacs.d/config/pylint.conf

(add-hook 'prog-mode-hook 'flycheck-mode)

(setq-default flycheck-clang-language-standard "c++11")

