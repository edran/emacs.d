;;; package --- Summary:

;;; Commentary:

;; Haskell Mode
;;; Code:
(add-to-list 'load-path "~/.emacs.d/vendor/haskell-mode/")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-to-list 'completion-ignored-extensions ".hi")

(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.cabal/share/ghc-mod-3.1.6")

(load "~/.emacs.d/vendor/haskell-mode/haskell-mode-autoloads.el")
(add-to-list 'Info-default-directory-list "~/.emacs.d/vendor/haskell-mode.el/")

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (ghc-init)))
;;; haskell-mode ends here
