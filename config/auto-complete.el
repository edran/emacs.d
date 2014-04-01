(require 'auto-complete)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General

(setq ac-comphist-file "~/.emacs.d/config/ac-dict/ac-cmphist.dat")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell Mode

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

