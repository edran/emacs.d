;; TRAMP stands for `Transparent Remote (file) Access, Multiple
;; Protocol'. This package provides remote file editing, similar to
;; Ange-FTP. The difference is that Ange-FTP uses FTP to transfer
;; files between the local and the remote host, whereas TRAMP uses a
;; combination of rsh and rcp or other work-alike programs, such as
;; ssh/scp.

;; /server.com:/home/edran/public/foo.html


(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-verbose 10)
(setq tramp-debug-buffer t)
