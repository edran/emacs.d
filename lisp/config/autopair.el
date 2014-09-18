(defvar *paredit-modes*
  '(common-lisp-mode lisp-mode emacs-lisp-mode clojure-mode lisp-interaction-mode)
  "A list of modes wherein I use paredit.")

(require 'autopair)
(autopair-global-mode)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

(defun custom-paredit-mode ()
  (progn (paredit-mode +1)
         (define-key paredit-mode-map (kbd "<C-left>") 'backward-sexp)
         (define-key paredit-mode-map (kbd "<C-right>") 'forward-sexp)))

(dolist (mode *paredit-modes*)
  ;; Activate paredit and deactivate autopair in lisp modes
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            (lambda ()
              (custom-paredit-mode)
              (setq autopair-dont-activate t)
              (autopair-mode -1))))
