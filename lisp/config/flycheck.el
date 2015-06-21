(require 'flycheck)

;; basic config

(setq flycheck-check-syntax-automatically '(save
                                            new-line
                                            mode-enabled)
      flycheck-highlighting-mode 'symbols)

(defun me/set-flycheck-auto-speed ()
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 2.0 20.0)))
;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'me/set-flycheck-auto-speed)
(add-hook 'prog-mode-hook 'flycheck-mode)

;; This got annoying quite quickly
;; (require 'pos-tip)
;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))


;; ######## elisp

(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(setq-default flycheck-emacs-lisp-load-path 'inherit)


;; ######## C/C++

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-gcc-include-path (list "/opt/ros/indigo/include/"))))
(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-gcc-language-standard "c++11")))


;; ######## Haskell

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
