(require 'org)
(require 'org-ac)

(org-ac/config-default)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(org-agenda-files 
  (quote 
   ("~/Dropbox/org/rad.org" 
    "~/Dropbox/org/life.org"
    "~/Dropbox/org/uni.org")))
