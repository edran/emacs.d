(require 'auto-complete)

(setq ac-comphist-file "~/.emacs.d/config/ac-cmphist.dat")

;; #### Haskell Mode ####

(ac-define-source ghc-mod
		  '((depends ghc)
		    (candidates . (ghc-select-completion-symbol))
		    (symbol . "s")
		    (cache)))

(defun my-ac-haskell-mode ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers
		     ac-source-dictionary
		     ac-source-ghc-mod)))
(add-hook 'haskell-mode-hook 'my-ac-haskell-mode)

;; [==:INIT fnd-file-hook==]
(defun my-haskell-ac-init ()
  (when (member (file-name-extension buffer-file-name) '("hs" "lhs"))
    (auto-complete-mode t)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
		       ac-source-dictionary
		       ac-source-ghc-mod))))
(add-hook 'find-file-hook 'my-haskell-ac-init)

