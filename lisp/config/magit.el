;; (eval-after-load 'magit '(require 'setup-magit))

;; full screen magit-status
(setq magit-last-seen-setup-instructions "1.4.0")

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(eval-after-load 'magit '(define-key magit-status-mode-map (kbd "q")
                           'magit-quit-session))
