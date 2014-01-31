(server-start)


;; Add packages directory and files not in subdirectories
(add-to-list 'load-path "~/.emacs.d/") ;;was packages
(progn (cd "~/.emacs.d/")
       (normal-top-level-add-subdirs-to-load-path))
       (normal-top-level-add-to-load-path '("."))

;;(set-default-font "Inconsolata 9")
;;(set-frame-font "Inconsolata" 9 )
;;(set-frame-font "Anonymous Pro 9")
(set-frame-font "Ubuntu Mono 9")

;;(auto-fill-mode t)
(setq fill-column 78)

;; Code to deal with emacs 24 update (solarized)
(if
    (equal 0 (string-match "^24" emacs-version))
    ;; it's emacs24, so use built-in theme 
    (require 'solarized-dark-theme)
  ;; it's NOT emacs24, so use color-theme
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark)))
(load-theme 'solarized-dark t)

;;; Shut up compile saves
(setq compilation-ask-about-save nil)
;;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))

;; Set cursor color to white
;;(set-cursor-color "#ffffff") 

;; Set mouse color
(set-mouse-color "white")

;; Keyset for switching between frames
(global-set-key [s-left] 'windmove-left) 
(global-set-key [s-right] 'windmove-right) 
(global-set-key [s-up] 'windmove-up) 
(global-set-key [s-down] 'windmove-down)

;; Scrolling down
(global-set-key (quote [M-down]) (quote scroll-up-line))
(global-set-key (quote [M-up]) (quote scroll-down-line)) 

;; Custom set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes 
   (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6"
	   "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365"
	   default)))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; No useless stuff, please
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Stuff
(setq default-directory "~/")
(global-linum-mode 1) ; display line numbers in margin.
(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(recentf-mode 1) ; keep a list of recently opened files
(setq line-move-visual nil) ; use t for true, nil for false
(global-visual-line-mode 1) ; 1 for on, 0 for off.
(global-hl-line-mode 1) ; turn on highlighting current line
(setq next-line-add-newlines t) ;add newline with c-n at EOL
(setq line-number-mode t)
(setq column-number-mode t)

(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0) ) )

(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.5) ; add 0.5 height between lines
    (setq-default line-spacing nil)   ; no extra heigh between lines
    )
  (redraw-display))
