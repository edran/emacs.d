(require 'fill-column-indicator)

(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))

(setq fill-column 80)
(setq fci-rule-color "#5f5f5f") ;;zenburn

(global-fci-mode t)
