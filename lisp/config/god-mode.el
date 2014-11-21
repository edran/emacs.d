;; (load-library "god-mode")
(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(defun my-update-cursor ()
  (setq cursor-type (if (or (not god-global-mode)
                            god-local-mode
                            buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)

;; TODO: change hl-line-face instead of modeline (or both?)

(defun god-mode-update-cursor-colour ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line
                                                 (if limited-colors-p
                                                     "white" "#202020"))
                            (set-face-background 'mode-line-inactive
                                                 (if limited-colors-p
                                                     "white" "#2D2D2D"))))
          (t (progn
               (set-face-background 'mode-line
                                    (if limited-colors-p
                                        "black" "#8b0000"))
               (set-face-background 'mode-line-inactive
                                    (if limited-colors-p
                                        "black" "#2D2D2D"))))))) ;; Hack

(add-hook 'god-mode-enabled-hook 'god-mode-update-cursor-colour)
(add-hook 'god-mode-disabled-hook 'god-mode-update-cursor-colour)

(define-key god-local-mode-map (kbd "z") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)

(add-to-list 'god-exempt-major-modes 'eshell-mode)

(god-mode-all)

;; (global-set-key (kbd "C-x C-1") 'delete-other-windows)
;; (global-set-key (kbd "C-x C-2") 'split-window-below)
;; (global-set-key (kbd "C-x C-3") 'split-window-right)
;; (global-set-key (kbd "C-x C-0") 'delete-window)
