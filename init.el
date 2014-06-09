;; (server-start)
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
 '(custom-safe-themes (quote ("6e92ca53a22d9b0577ad0b16e07e2e020c8b621197e39fec454048e51b7954cb" "8b231ba3e5f61c2bb1bc3a2d84cbd16ea17ca13395653566d4dfbb11feaf8567" "cd70962b469931807533f5ab78293e901253f5eeb133a46c2965359f23bfb2ea" default)))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
