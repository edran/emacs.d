(require 'org)
(require 'org-capture)
(require 'org-agenda)
;; (require 'org-ac) ;; breaks god-mode
;; (org-ac/config-default)

(setq org-directory "~/Dropbox/org")
(setq org-agenda-files
  (quote
   ("~/Dropbox/org")))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,org-default-notes-file "Tasks")
       "* [ ] %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

(setq org-tag-alist '(("@uni" . ?u)
                      ("@reading" . ?e)
                      ("@tutorial" . ?t)
                      ("@coursework" . ?c)
                      ("@personal" . ?p)
                      ("@rad" . ?r)
                      ))

(add-hook 'org-mode-hook
      '(lambda ()
         (setq org-file-apps
           '((auto-mode . emacs)
             ("\\.mm\\'" . default)
             ("\\.x?html?\\'" . default)
             ("\\.pdf\\'" . "evince %s")))))

(setq org-agenda-custom-commands
      '(("f" occur-tree "FIXME")))

;; (add-hook 'org-mode-hook 'writegood-mode)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-cycle-separator-lines 1)
(setq org-catch-invisible-edits 'error)
(setq org-log-done t)
(add-hook 'org-mode-hook 'turn-on-flyspell)
;; (setq org-image-actual-width '(200))

(setq org-latex-create-formula-image-program 'dvipng)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
(setq org-src-fontify-natively t)
