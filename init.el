(server-start)
(add-to-list 'load-path "~/.emacs.d")

(load  "~/.emacs.d/local-config.el")



;; ;; Add packages directory and files not in subdirectories
;; (add-to-list 'load-path "~/.emacs.d/") ;;was packages
;; (progn (cd "~/.emacs.d/")
;;        (normal-top-level-add-subdirs-to-load-path))
;;        (normal-top-level-add-to-load-path '("."))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
