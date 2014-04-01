(require 'ein)
;; M-x ein:notebooklist-open to open notebook

(require 'ein-ac)
(require 'ein-smartrep)

(setq ein:use-auto-complete t)
;; Or, to enable "superpack" (a little bit hacky improvements):
;; (setq ein:use-auto-complete-superpack t)

(setq ein:use-smartrep t)

;; Standard Jedi.el setting
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(require 'python-django)
(global-set-key (kbd "C-x j") 'python-django-open-project)

;; Type:
;;     M-x package-install RET jedi RET
;;     M-x jedi:install-server RET
;; Then open Python file.

;; <C-tab> jedi:complete
;; Complete code at point.

;; C-c ? jedi:show-doc
;; Show the documentation of the object at point.

;; C-c . jedi:goto-definition
;; Goto the definition of the object at point.

;; See jedi:goto-definition-config for how this function works when universal prefix arguments (C-u) are given. If numeric prefix argument(s) (e.g., M-0) are given, goto point of the INDEX-th result. Note that you cannot mix universal and numeric prefixes. It is Emacs’s limitation. If you mix both kinds of prefix, you get numeric prefix.

;; When used as a lisp function, popup a buffer when OTHER-WINDOW is non-nil. DEFTYPE must be either assignment (default) or definition. When USE-CACHE is non-nil, use the locations of the last invocation of this command. If INDEX is specified, goto INDEX-th result.

;; C-c , jedi:goto-definition-pop-marker
;; Goto the last point where jedi:goto-definition was called.
