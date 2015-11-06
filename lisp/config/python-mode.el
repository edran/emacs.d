(global-set-key [f5] 'run-python)
(defun run-python3 () (interactive) (run-python "python3"))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
