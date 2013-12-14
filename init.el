(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))


;; Add packages directory and files not in subdirectories
(add-to-list 'load-path "~/.emacs.d/") ;;was packages
(progn (cd "~/.emacs.d/")
       (normal-top-level-add-subdirs-to-load-path))
       (normal-top-level-add-to-load-path '("."))

;; Set packages for package.el
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;;(set-default-font "Inconsolata 9")
;;(set-frame-font "Inconsolata" 9 )
(set-frame-font "Anonymous Pro 9")

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

;; Auto pair mode - pairing braces and stuff
;;(require 'autopair)
;;(autopair-global-mode) ;; to enable in all buffers

;; 80 COLUMS MARKER
(require 'whitespace)
(setq whitespace-line-column 78) ;; limit line length
(setq whitespace-style '(face lines-tail))

;;(add-hook 'prog-mode-hook 'whitespace-mode) ;;only programming modes
(global-whitespace-mode +1) ;;globally activated

;;;; Git-Mode

;;(require 'git)
(autoload 'magit-status "magit" nil t)

(autoload 'magit-status "magit" nil t)


;;;;org-mode configuration

;; Enable org-mode
(require 'org)

;; Make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(add-hook 'org-mode-hook 'turn-on-font-lock) ;; not needed when 
                                             ;; global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; Flyspell

(setq-default ispell-program-name "aspell")
(setq flyspell-default-dictionary "english")

(add-hook 'markdown-mode 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'html-mode-hook 'flyspell-mode)

;; Completion words longer than 4 characters
(custom-set-variables
 '(ac-ispell-requires 4))

;; (eval-after-load "auto-complete"
;;   '(progn
;;      (ac-ispell-setup)))

;; (defun my/enable-ac-ispell ()
;;   (add-to-list 'ac-sources 'ac-source-ispell))

;; (add-hook 'git-commit-mode-hook 'my/enable-ac-ispell)
;; (add-hook 'mail-mode-hook 'my/enable-ac-ispell)

;; Autocomplete

(require 'auto-complete-config)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; Markdown Mode

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Clang
(require  'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;(add-to-list 'load-path (concat myoptdir "AC"))
;;(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (concat myoptdir "AC/ac-dict"))
(require 'auto-complete-clang)
(global-set-key (kbd "C-`") 'ac-complete-clang)

  ;; (custom-set-variables
  ;;   '(ac-etags-requires 1))

  ;; (eval-after-load "etags"
  ;;   '(progn
  ;;       (ac-etags-setup)))

  ;; (defun my/c-mode-common-hook ()
  ;;   (add-to-list 'ac-sources 'ac-source-etags))

  ;; (add-hook 'c-mode-common-hook 'my/c-mode-common-hook)

;; (setq ac-auto-start nil)
;; (setq ac-quick-help-delay 0.5)
;; ;; (ac-set-trigger-key "TAB")
;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (defun my-ac-config ()
;;   (setq-default ac-sources 
;; 		'(ac-source-abbrev ac-source-dictionary 
;; 				   ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ;; ac-source-gtags
;; (my-ac-config)

;; Golang

(require 'go-autocomplete)

(add-to-list 'ac-modes 'go-mode)


;; ########  LaTeX  ########

;; Math auto-complete 

(require 'ac-math)

(add-to-list 'ac-modes 'latex-mode) ;; make auto-complete aware of `latex-mode`

(defun ac-latex-mode-setup () ;; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode 
		  ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )

(add-hook 'latex-mode-hook 'ac-latex-mode-setup)

;; Because auto-complete and jedi are installed from MELPA

(require 'package)
(package-initialize)

;;auto-complete

(require 'popup)
(require 'fuzzy)
(require 'auto-complete-config)

(global-auto-complete-mode t)
(ac-config-default)

(setq ac-auto-start nil)


;;Python mode
;; --------------------------------------
;; python for emacs

(load-file "~/.emacs.d/packages/emacs-for-python/epy-init.el")

;; Each of them enables different parts of the system.
;; Only the first two are needed for pep8, syntax check.
(require 'epy-setup) ;; It will setup other loads, it is required!
(require 'epy-python) ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings[optional]
(require 'epy-editing) ;; For configurations related to editing [optional]
;; [newer version of emacs-for-python]
(require 'epy-nose) ;; For shortcut to call nosetests [optional]

;; Define f10 to previous error
;; Define f11 to next error
(require 'epy-bindings) ;; For my suggested keybindings [optional]

;; Some shortcut that do not collide with gnome-terminal,
;; otherwise, "epy-bindings" define f10 and f11 for them.
(global-set-key [f2] 'flymake-goto-prev-error)
(global-set-key [f3] 'flymake-goto-next-error)

;; Next two lines are the checks to do. You can add more if you wish.
;; (epy-setup-checker "pyflakes %f") ;; For python syntax check
(epy-setup-checker "pep8-python2 -r %f") ;; For pep8 check

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
     ; Make sure it's not a remote buffer or flymake would not work
    (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "pyflakes" (list local-file)))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

;; highlights indentation
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

;; (defun my/python-mode-hook ()
;;   (jedi:setup)
;;   (define-key python-mode-map (kbd "C-M-i") 'jedi:complete))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)
;;(add-hook 'python-mode-hook '(
;;			      lambda () 
;;				     (define-key python-mode-map "\C-m" 
;;				       'newline-and-indent)))
	
;; (require 'python)
;; (defun python--add-debug-highlight ()
;;   "Adds a highlighter for use by `python--pdb-breakpoint-string'"
;;   (highlight-lines-matching-regexp "## DEBUG ##\\s-*$" 'hi-red-b))
 
;; (add-hook 'python-mode-hook 'python--add-debug-highlight)
 
;;(defvar python--pdb-breakpoint-string 
;;  "import pdb; pdb.set_trace() ## DEBUG ##"
;;   "Python breakpoint string used by `python-insert-breakpoint'")
 
;; (defun python-insert-breakpoint ()
;;   "Inserts a python breakpoint using `pdb'"
;;   (interactive)
;;   (back-to-indentation)
;;   ;; this preserves the correct indentation in case the line above
;;   ;; point is a nested block
;;   (split-line)
;;   (insert python--pdb-breakpoint-string))
;; (define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint)
 
;; (defadvice compile (before ad-compile-smart activate)
;;   "Advises `compile' so it sets the argument COMINT to t
;; if breakpoints are present in `python-mode' files"
;;   (when (derived-mode-p major-mode 'python-mode)
;;     (save-excursion
;;       (save-match-data
;;         (goto-char (point-min))
;;  (if (re-search-forward (concat "^\\s-*" 
;;				 python--pdb-breakpoint-string "$")
;;                                (point-max) t)
;;             ;; set COMINT argument to `t'.
;;             (ad-set-arg 1 t))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Haskell-mode
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/packages/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)))

(eval-after-load "haskell-cabal"
  '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

;; Mini map
(require 'minimap)

;; Ag, the silver searcher
(require 'ag)
(setq ag-highlight-search t)
;;(setq ag-reuse-window 't)

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
 '(org-agenda-files (quote ("~/Documents/Org/doc.org")))
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
