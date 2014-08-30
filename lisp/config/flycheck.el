(require 'flycheck)

;; (setq flycheck-check-syntax-automatically '(mode-enabled idle-change))

(defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
  "Adjust how often we check for errors based on if there are any.

This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 0.5 30.0)))

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'magnars/adjust-flycheck-automatic-syntax-eagerness)

;; Disable annoying documentation warnings for lisp code
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; run pylint --rcfile=~/.emacs.d/config/pylint.conf

(add-hook 'prog-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(save
                                            idle-change
                                            mode-enabled))

(setq-default flycheck-clang-language-standard "c++11")

(setq flycheck-highlighting-mode 'symbols)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(require 'pos-tip)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
