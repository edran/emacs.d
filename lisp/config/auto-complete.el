(require 'auto-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General

(setq ac-comphist-file "~/.emacs.d/config/ac-dict/ac-cmphist.dat")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(define-key ac-menu-map
  (kbd "M-n") 'ac-next)

(define-key ac-menu-map
  (kbd "M-p") 'ac-previous)

(setq ac-auto-show-menu 0.8)
(setq ac-delay 0.1)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; (require 'popup-pos-tip)
;; (defadvice popup-tip
;;   (around popup-pos-tip-wrapper (string &rest args) activate)
;;   (if (eq window-system 'x)
;;       (apply 'popup-pos-tip string args)
;;     ad-do-it))

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

;;;;;;;;;; CC-MODEs

(require 'auto-complete-clang)
(defun my:ac-c-init()
  (require 'auto-complete-c-headers)
  (require 'auto-complete-clang)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-clang)
  (setq ac-clang-flags
        (mapcar (lambda (item)(concat "-I" item))
                (split-string
                 "
 /opt/ros/hydro/include
 /usr/include/c++/4.6
 /usr/include/c++/4.6/x86_64-linux-gnu/.
 /usr/include/c++/4.6/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.6/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
"
                 )))
  ;; (require 'auto-complete-chunk) ;; Probably useful with python?
  )

(add-hook 'c++-mode-hook 'my:ac-c-init)
(add-hook 'c-mode-hook 'my:ac-c-init)

(require 'semantic)
(semantic-mode 1)
(global-semantic-idle-scheduler-mode 1)
;; backend for auto complete

(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-set-key (kbd "M-C-I") 'ac-fuzzy-complete) ;; Meh.
(custom-set-variables
 '(ac-use-fuzzy t))

(global-set-key (kbd "M-i") 'hippie-expand)
