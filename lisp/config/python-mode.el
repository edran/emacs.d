(require 'python)
(require 'ein)
;; M-x ein:notebooklist-open to open notebook

(require 'ein-ac)
(require 'ein-smartrep)

;; Standard Jedi.el setting
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook 'jedi:setup)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 ein:use-auto-complete t
 ein:use-smartrep t
 jedi:complete-on-dot t)

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

;; See jedi:goto-definition-config for how this function works when
;; universal prefix arguments (C-u) are given. If numeric prefix
;; argument(s) (e.g., M-0) are given, goto point of the INDEX-th
;; result. Note that you cannot mix universal and numeric prefixes. It
;; is Emacs’s limitation. If you mix both kinds of prefix, you get
;; numeric prefix.

;; When used as a lisp function, popup a buffer when OTHER-WINDOW is
;; non-nil. DEFTYPE must be either assignment (default) or definition.
;; When USE-CACHE is non-nil, use the locations of the last invocation
;; of this command. If INDEX is specified, goto INDEX-th result.

;; C-c , jedi:goto-definition-pop-marker
;; Goto the last point where jedi:goto-definition was called.

;; (defun run-python2 () (interactive) (run-python "python"))
(global-set-key [f5] 'run-python)

(defun run-python3 () (interactive) (run-python "python3"))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "/path/to/your/virtualenvs/") ;; see secrets.el
