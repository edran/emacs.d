(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Example of expansion
;; (defun er/add-text-mode-expansions ()
;;   (make-variable-buffer-local 'er/try-expand-list)
;;   (setq er/try-expand-list (append
;;                             er/try-expand-list
;;                             '(mark-paragraph
;;                               mark-page))))

;; (add-hook 'text-mode-hook 'er/add-text-mode-expansions)
