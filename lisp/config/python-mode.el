(require 'python)
(require 'ein)
;; M-x ein:notebooklist-open to open notebook

(require 'ein-smartrep)

;; Standard Jedi.el setting
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 ein:use-smartrep t
 jedi:complete-on-dot t)

(require 'python-django)
(global-set-key (kbd "C-x j") 'python-django-open-project)

;; Type:
;;     M-x package-install RET jedi RET
;;     M-x jedi:install-server RET
;; Then open Python file.

;; (defun run-python2 () (interactive) (run-python "python"))
(global-set-key [f5] 'run-python)

(defun run-python3 () (interactive) (run-python "python3"))

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "/path/to/your/virtualenvs/") ;; see secrets.el
