(global-set-key [f5] 'run-python)
(defun run-python3 () (interactive) (run-python "python3"))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; interactive shell support
(venv-initialize-eshell);; eshell support

(defvar virtualenvs-path
  (substitute-in-file-name (concat "$HOME" "/.dotfiles/venvs")))

(setq venv-location virtualenvs-path)
