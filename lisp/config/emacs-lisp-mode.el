(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x E") 'eval-region-or-buffer)))

(defun enable-rainbow-mode-if-theme ()
  (when (string-match "-theme\\.el" (buffer-name))
    (rainbow-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'enable-rainbow-mode-if-theme)
