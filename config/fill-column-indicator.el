(add-to-list 'load-path "~/.emacs.d/fill-column-indicator-1.83")

(require 'fill-column-indicator)

(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))

(setq fill-column 80)
(setq fci-rule-color "#073642")

(global-fci-mode t)
