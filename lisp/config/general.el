;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Save a list of recent files visited.
;; (open recent file with C-x f)
(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
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

;; To edit via sudo (look at .zsh )
(require 'tramp)
(setq tramp-default-method "ssh")

(require 'browse-kill-ring)
(global-set-key (kbd "M-y") 'browse-kill-ring)

(require 'undo-tree)
(global-undo-tree-mode)

;; (require 'magit)

(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward-angle-brackets))

;; MANY KEYBINDINGS
;; some taken from emacs-prelude

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; Start proced in a similar manner to dired
(unless (eq system-type 'darwin)
    (global-set-key (kbd "C-x p") 'proced))

;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)

(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-c j") 'ace-jump-mode)
(global-set-key (kbd "C-c M-.") 'ace-jump-mode)
(global-set-key [remap other-window] 'ace-window)

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(global-unset-key (kbd "C-z"))


; roslaunch highlighting
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))


(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x r" "C-x 4" "C-x v" "C-x 8" "C-u"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/highlight-command-regexp "rectangle")
(setq guide-key/idle-delay 0.7)


(require 'iedit)
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-:") 'iedit-rectangle-mode)


(require 'key-chord)
(key-chord-define-global "jk" 'god-local-mode)
(key-chord-define-global "vg"     'eval-region)
(key-chord-define-global "vb"     'eval-buffer)
(key-chord-define-global "cy"     'yank-pop)
(key-chord-define-global "cg"     "\C-c\C-c")
; Frame Actions
(key-chord-define-global "xo"     'other-window);
;; (Key-Chord-Define-Global "X1"     'Delete-Other-Windows)
;; (Key-chord-define-global "x0"     'delete-window)
(key-chord-define-global "xk"     'kill-this-buffer-if-not-modified)
; file actions
;; (key-chord-define-global "bf" 'ido-switch-buffer)
;; (key-chord-define-global "xf" 'ido-find-file)
(key-chord-define-global "zs" "\C-x\C-s")
(key-chord-define-global "vc" 'vc-next-action)
(key-chord-define-global "fd" 'me/eshell)
(key-chord-mode 1)
(defun kill-this-buffer-if-not-modified ()
  (interactive)
  ; taken from menu-bar.el
  (if (menu-bar-non-minibuffer-window-p)
      (kill-buffer-if-not-modified (current-buffer))
    (abort-recursive-edit)))

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)


(require 'autorevert)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(require 'deft)
(setq deft-extensions '("org" "md"))
(setq deft-default-extension "org")
(setq deft-directory "~/Dropbox/org/files")
;; (setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key (kbd "<f11>") 'deft)
(setq deft-auto-save-interval 20.0)


(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-buffers 't)


(add-hook 'prog-mode-hook 'whitespace-cleanup-mode)


(persp-mode)


(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
(yas-global-mode 1)
(setq yas-prompt-functions
      '(yas-dropdown-prompt
        yas-completing-prompt))
(add-hook 'term-mode-hook
 	  (lambda() (yas-minor-mode -1)))

(require 'ispell)
(setq ispell-dictionary "british")
