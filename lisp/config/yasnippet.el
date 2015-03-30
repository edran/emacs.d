(require 'yasnippet)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)

(yas-global-mode 1)

(setq yas-prompt-functions
      '(yas-dropdown-prompt
        yas-completing-prompt))
(add-hook 'term-mode-hook
 	  (lambda() (yas-minor-mode -1)))
