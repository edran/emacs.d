(require 'company)
(require 'company-c-headers)

(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "<tab>") #'company-complete)

;; ##### C/C++

(eval-after-load 'company
   '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9/")
(add-to-list 'company-c-headers-path-system "/opt/ros/indigo/include")

;; ##### Python

(add-hook 'python-mode-hook 'anaconda-mode)
(add-to-list 'company-backends 'company-anaconda)
