(require 'company)

(add-hook 'after-init-hook 'global-company-mode)


;; ##### C/C++

(eval-after-load 'company
   '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(add-to-list 'company-backends 'company-c-headers)
(define-key company-active-map (kbd "<tab>") #'company-complete)


;; ##### Python

(add-hook 'python-mode-hook 'anaconda-mode)
(add-to-list 'company-backends 'company-anaconda)
