;;; package --- Summary:
;;; Commentary:

;; Haskell Mode
;;; Code:

;; REQUIRES happy and ghc-mod


(require 'haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-to-list 'completion-ignored-extensions ".hi")

;; (add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.cabal/share/ghc-mod-4.1.1")

(let ((cabal-path  (expand-file-name "~/.cabal/bin")))
 (add-to-list 'exec-path cabal-path)
 (setenv "PATH" (concat cabal-path ":" (getenv "PATH"))))

;; (load "~/.emacs.d/vendor/haskell-mode/haskell-mode-autoloads.el")
;; (add-to-list 'Info-default-directory-list "~/.emacs.d/vendor/haskell-mode.el/")

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

;;; haskell-mode ends here
