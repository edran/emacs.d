;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Save a list of recent files visited.
;; (open recent file with C-x f)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;;Settings for M-x compile
(require 'compile)
;; Shut up compile saves
(setq compilation-ask-about-save nil)
;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))

;; Delete selected text when typing
(delete-selection-mode 1)

;; Highlighting keystrokes like other editors
(transient-mark-mode t)

;; Delete trailing whitespace when saving (compliance with PEP8 and others)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable x clipoard (TODO will it work with emacsclient too?)
(setq x-select-enable-clipboard t)

;; Make sure I only have to use y o n
(defalias 'yes-or-no-p 'y-or-n-p)

;; add newline with c-n at EOL
(setq next-line-add-newlines t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

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

(setq paragraph-start "\f\\|[ \t]*$\\|[-*] +.+$"
          paragraph-separate "$")

;; TODO check which files go here...
(setq temporary-file-directory "~/.emacs.d/tmp/")

(require 'saveplace)
(setq save-place-file "~/.emacs.d/.saveplace")
(setq-default save-place t)

(setq recentf-save-file "~/.emacs.d/.recentf")

;; To edit via sudo (look at .zsh )
(require 'tramp)
(setq tramp-default-method "ssh")

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(setq smex-save-file "~/.emacs.d/.smex-items")

(require 'browse-kill-ring)
(global-set-key (kbd "M-y") 'browse-kill-ring)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'magit)

(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward-angle-brackets))

;; MANY KEYBINDINGS
;; some taken from emacs-prelude

(defun me/eshell ()
  "Bring up a full-screen eshell or restore previous config."
  (interactive)
  (if (string= "eshell-mode" major-mode)
      (jump-to-register :eshell-fullscreen)
    (progn
      (window-configuration-to-register :eshell-fullscreen)
      (eshell)
      (delete-other-windows))))

(global-set-key (kbd "C-c t") 'me/eshell)


;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; Start proced in a similar manner to dired
(unless (eq system-type 'darwin)
    (global-set-key (kbd "C-x p") 'proced))

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'smex)

;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)

;; A quick major mode help with discover-my-major
(define-key 'help-command (kbd "C-m") 'discover-my-major)

(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-c j") 'ace-jump-mode)
(global-set-key (kbd "s-.") 'ace-jump-mode)
(global-set-key (kbd "C-c J") 'ace-jump-buffer)
(global-set-key (kbd "s->") 'ace-jump-buffer)

(global-set-key [remap other-window] 'ace-window)

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)
