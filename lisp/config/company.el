(require 'company)
(require 'company-c-headers)

(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "<tab>") #'company-complete)

;; ##### C/C++
(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-c-headers)
     (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9/")
     (add-to-list 'company-c-headers-path-system "/opt/ros/indigo/include")
     ))

;; ##### Python

(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)))
