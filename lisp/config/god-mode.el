;; (load-library "god-mode")
(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar))
  (set-cursor-color (if (or god-local-mode buffer-read-only)
                        "#ffffff"
                      "#FF0000")))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)

(define-key god-local-mode-map (kbd "z") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)

;; (global-set-key (kbd "C-x C-1") 'delete-other-windows)
;; (global-set-key (kbd "C-x C-2") 'split-window-below)
;; (global-set-key (kbd "C-x C-3") 'split-window-right)
;; (global-set-key (kbd "C-x C-0") 'delete-window)
