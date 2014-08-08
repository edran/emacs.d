;;; package -- Summary:
;;; Commentary:

;;; Code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UTF-8 please

(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Save a list of recent files visited.
;; (open recent file with C-x f)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Settings for M-x compile

(require 'compile)
;; Shut up compile saves
(setq compilation-ask-about-save nil)
;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A modern behaviour for emacs

;; Delete selected text when typing
(delete-selection-mode 1)

;; Highlighting keystrokes like other editors
(transient-mark-mode t)

;; Enable x clipoard (TODO will it work with emacsclient too?)
(setq x-select-enable-clipboard t)

;; Make sure I only have to use y o n
(defalias 'yes-or-no-p 'y-or-n-p)

;; add newline with c-n at EOL
(setq next-line-add-newlines t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(require 'autorevert)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; TABS ARE EVIL
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To refactor

(setq default-directory "~/")

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
;; (setq line-move-visual t) ; use t for true, nil for false

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files
(auto-compression-mode t)

;; (auto-fill-mode t)
(setq fill-column 80)

;; TODO check which files go here...
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; To edit via sudo (look at .zsh )
(require 'tramp) 

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'browse-kill-ring)

(require 'undo-tree)

(require 'magit)

(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)

(define-key god-local-mode-map (kbd "z") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)

;; (global-set-key (kbd "C-x C-1") 'delete-other-windows)
;; (global-set-key (kbd "C-x C-2") 'split-window-below)
;; (global-set-key (kbd "C-x C-3") 'split-window-right)
;; (global-set-key (kbd "C-x C-0") 'delete-window)

(require 'ido-ubiquitous-autoloads)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)


(global-set-key (kbd "C-c t")
                (lambda ()
                  "Bring up a full-screen eshell or restore previous config."
                  (interactive)
                  (if (string= "eshell-mode" major-mode)
                      (jump-to-register :eshell-fullscreen)
                    (progn
                      (window-configuration-to-register :eshell-fullscreen)
                      (eshell)
                      (delete-other-windows)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; general.el ends here
