;; REQUIRES happy and ghc-mod

(require 'haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-to-list 'completion-ignored-extensions ".hi")


(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")
(custom-set-variables '(haskell-tags-on-save t))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; (add-hook 'haskell-mode-hook 'inf-haskell-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t)
  ;;  '(haskell-process-type 'cabal-repl)
  '(haskell-process-type 'ghci) ;; if cabal --version < 1.18
  )

(dolist (hook '(haskell-mode-hook inferior-haskell-mode-hook haskell-interactive-mode-hook))
  (add-hook hook 'turn-on-haskell-doc-mode)
  (add-hook hook (lambda () (subword-mode +1))))

;; (add-hook 'haskell-mode-hook 'turn-on-hi2)

;; (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;; (setq-default haskell-stylish-on-save t)

(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
     (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
     (define-key haskell-mode-map (kbd "C-o") 'open-line)))

(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
