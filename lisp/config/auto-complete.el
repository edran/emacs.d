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

(defun my:ac-c-init()
  (require 'auto-complete-c-headers)
  (require 'auto-complete-clang)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-clang)
  (add-to-list 'achead:include-directories 
               '"/usr/lib/gcc/x86_64-linux-gnu/4.6/include")
  (add-to-list 'achead:include-directories 
               '"/opt/ros/hydro/include")
(add-to-list 'achead:include-directories 
             '"/usr/include/c++/4.6")
(add-to-list 'achead:include-directories 
             '"/usr/include/c++/4.6/x86_64-linux-gnu/.")
(add-to-list 'achead:include-directories 
             '"/usr/include/c++/4.6/backward")
(add-to-list 'achead:include-directories 
             '"/usr/lib/gcc/x86_64-linux-gnu/4.6/include")
(add-to-list 'achead:include-directories 
             '"/usr/local/include")
(add-to-list 'achead:include-directories 
             '"/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed")
(add-to-list 'achead:include-directories 
             '"/usr/include/x86_64-linux-gnu")
(add-to-list 'achead:include-directories 
             '"/usr/include")
  ;; (require 'auto-complete-chunk) ;; Probably useful with python?
  )

;; (require 'auto-complete-clang-async)

;; (defun ac-cc-mode-setup ()
;;   (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
;;   (setq ac-sources '(ac-source-clang-async))
;;   (ac-clang-launch-completion-process)
;; )

;; (defun my-ac-clang-config ()
;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))

;; (my-ac-clang-config)

;; (setq ac-clang-flags
;;       (mapcar (lambda (item)(concat "-I" item))
;;               (split-string
;;                "
;; /opt/ros/hydro/include
;;  /usr/include/c++/4.6
;;  /usr/include/c++/4.6/x86_64-linux-gnu/.
;;  /usr/include/c++/4.6/backward
;;  /usr/lib/gcc/x86_64-linux-gnu/4.6/include
;;  /usr/local/include
;;  /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed
;;  /usr/include/x86_64-linux-gnu
;;  /usr/include
;; "
;;                )))

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

(require 'ede)
(global-ede-mode 1)
(ede-enable-generic-projects) ;; Remember to do ede-customize-project RET

;; (ede-cpp-root-project "some_project" :file "/some/dir/main.cpp" 
;;                       :include-path '("../include"))
