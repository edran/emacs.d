(require 'erc)
(require 'erc-sound)
(require 'znc)
(require 'erc-match)
(require 'erc-image)
(require 'erc-tweet)
(require 'erc-hl-nicks)
(require 'erc-youtube)

'(erc-modules (quote (autoaway
 autojoin button completion fill irccontrols list log match menu
 move-to-prompt netsplit networks noncommands readonly ring
 services sound stamp spelling track youtube tweet image colorize)))

(erc-update-modules)

(setq erc-prompt (lambda () (concat "[" (buffer-name) "]>")))
(setq erc-keywords '("edran"))

(setq erc-current-nick-highlight-type (quote all))
(setq erc-default-sound nil)
(setq erc-log-channels-directory "~/.emacs.d/erc-log")
(setq erc-lurker-hide-list (quote ("JOIN" "NICK" "PART" "QUIT")))
(setq erc-minibuffer-notice t)
(setq erc-nick-uniquifier "_")
(setq erc-track-exclude-types (quote ("JOIN" "NICK" "PART" "QUIT" "333" "353")))
(setq erc-track-showcount t)
(setq erc-colorize-mode t)
(setq znc-detatch-on-kill t)

(defun me/znc ()
  "Connect to ZNC.
Prompt for password first."
  (interactive)
  (let ((pwd (read-passwd "Password: ")))
    (znc-erc-connect `(znc "178.62.20.216" 5000 t "edran/freenode" ,pwd))
    (znc-erc-connect `(znc "178.62.20.216" 5000 t "edran/imgnet" ,pwd))))

(defun me/start-irc ()
  (interactive)
  (me/znc)
  ;; (config-znc)
  ;; (znc-erc "freenode")
)

;; (defun config-znc ()
;;   (unless (boundp 'znc-password)
;;     (load-passwords))
;;   (setq znc-servers `(("apps.arthurnn.com" 5000 nil
;; 		       ((freenode ,"arthurnn" ,znc-password))))))
