;; (load-theme 'hc-zenburn)
; (load-theme 'noctilux)
;; (load-theme 'solarized-dark)

(require 'moe-theme)
(moe-dark)
(moe-theme-set-color 'w/b)
(powerline-center-theme)
(powerline-moe-theme)

(add-hook 'prog-mode 'nlinum-mode)
;; (global-nlinum-mode 1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil
      confirm-nonexistent-file-or-buffer nil
      line-number-mode t
      column-number-mode t
      frame-title-format "%b"
      font-lock-maximum-decoration t
      ;; should be useless given clean up on save
      show-trailing-whitespace t
      )

(setq-default display-buffer-reuse-frames t)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; Set clean graphic startup environment
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defadvice save-buffers-kill-emacs
  (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-flet ((process-list ())) ad-do-it))

(add-to-list 'default-frame-alist
             ;; '(font . "Inconsolata 9"))
             '(font . "Menlo 9"))

;; ; turn on highlighting current line
(global-hl-line-mode 1)

(add-hook 'prog-mode-hook 'column-enforce-mode)
(add-hook 'prog-mode-hook 'fci-mode)

(require 'paren)
(show-paren-mode t)
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(setq show-paren-style 'expression) ;; uncomment if annoying

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Visual line mode on every buffer.
;; (global-visual-line-mode nil)

;; Add F12 to toggle line wrap
(global-set-key (kbd "<f12>") 'toggle-truncate-lines)

(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0) ) )

(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line
height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.5) ; add 0.5 height between lines
    (setq-default line-spacing nil)   ; no extra heigh between lines
    )
  (redraw-display))

;; (load-theme 'cyberpunk t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

(require 'git-gutter-fringe+)
(global-git-gutter+-mode 1)
(setq git-gutter-fr+-side 'right-fringe)
(git-gutter-fr+-minimal)

;;make sure ansi colour character escapes are honoured
(require 'ansi-color)
(ansi-color-for-comint-mode-on)

(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
