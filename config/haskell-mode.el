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

(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/vendor/haskell-mode/")

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (ghc-init)))
;;; haskell-mode ends here
