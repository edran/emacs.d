(require 'guru-mode)

(guru-global-mode 1)
(add-hook 'minibuffer-setup-hook 'turn-off-guru-mode)
