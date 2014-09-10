(require 'flycheck)

(add-hook 'prog-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(save
                                            ;; idle-change ; I save a
                                            ;; lot anyway
                                            mode-enabled))

(defun set-flycheck-auto-speed ()
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 2.0 20.0)))

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'set-flycheck-auto-speed)

;; Disable annoying documentation warnings for lisp code
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; run pylint --rcfile=~/.emacs.d/config/pylint.conf

(setq-default flycheck-clang-language-standard "c++11")

(setq flycheck-highlighting-mode 'symbols)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; This got annoying quite quickly
;; (require 'pos-tip)
;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
