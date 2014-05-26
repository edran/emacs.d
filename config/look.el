;; Settings to make emacs nice-looking (Sure, sure...)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INITIAL EMACS

;; No startup screen
;; No message in scratch buffer
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq initial-scratch-message nil)

(setq confirm-nonexistent-file-or-buffer nil)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; Set cursor color to white
;; (set-cursor-color "#ffffff")

;; Set clean graphic startup environment
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fonts and characters

;; TODO - refactor to switch-fonts
;;(set-frame-font "Inconsolata" 9 )
;;(set-frame-font "Anonymous Pro 9")
(set-frame-font "Ubuntu Mono 10")

;; Show lines and columns info
(setq line-number-mode t)
(setq column-number-mode t)

;; display line numbers in margin
(global-linum-mode 1)
;; highlight text selection
(transient-mark-mode 1)
; turn on highlighting current line
(global-hl-line-mode 1)

;; Set mouse color
(set-mouse-color "white")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Parentheses highlighted

(require 'paren)
(show-paren-mode t)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in
        the echo area. Has no effect if the character before
        point is not of the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Various

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; (auto-fill-mode t)
(setq fill-column 78)

;; Visual line mode on every buffer.  
;; Words don't wrap randomly
(global-visual-line-mode nil) 
;; disable line wrap

;; (setq toggle-word-wrap)
;; make side by side buffers function the same as the main window
(setq truncate-partial-width-windows nil)
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
