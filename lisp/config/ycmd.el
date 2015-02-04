(require 'ycmd)
(ycmd-setup)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(set-variable 'ycmd-server-command '("python" "~/.emacs.d/vendor/ycmd/ycmd/"))

;; (set-variable 'ycmd-extra-conf-whitelist '("~/projects/*" "~/sandbox/*"))
(set-variable 'ycmd-global-config
              (concat (file-name-directory load-file-name)
                      ".ycm_global_conf.py"))

(require 'company-ycmd)
(company-ycmd-setup)
