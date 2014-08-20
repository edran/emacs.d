;;; package --- Summary:
;;; Commentary:

;; Haskell Mode
;;; Code:

;; REQUIRES happy and ghc-mod

(require 'haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-to-list 'completion-ignored-extensions ".hi")

;; (add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.cabal/share/ghc-mod-4.1.1")


(let ((cabal-path  (expand-file-name "~/.cabal/bin")))
 (add-to-list 'exec-path cabal-path)
 (setenv "PATH" (concat cabal-path ":" (getenv "PATH"))))

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (ghc-init)))

;; (define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer)

(add-hook 'haskell-mode-hook
	  '(lambda  ( )
	     (progn
	       (set-variable 'indent-tabs-mode nil)
	       (setq tab-width 8)
	       )))

;; (add-hook 'haskell-mode-hook 'inf-haskell-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t)
  '(haskell-process-type 'ghci))

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

(require 'haskell-cabal)
(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
;;; haskell-mode ends here
