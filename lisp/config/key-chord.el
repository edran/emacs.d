(require 'key-chord)

(key-chord-define-global "jk" 'god-local-mode)
(key-chord-define-global "vg"     'eval-region)
(key-chord-define-global "vb"     'eval-buffer)
(key-chord-define-global "cy"     'yank-pop)
(key-chord-define-global "cg"     "\C-c\C-c")
; Frame Actions
(key-chord-define-global "xo"     'other-window);
;; (Key-Chord-Define-Global "X1"     'Delete-Other-Windows)
;; (Key-chord-define-global "x0"     'delete-window)
(key-chord-define-global "xk"     'kill-this-buffer-if-not-modified)
; file actions
(key-chord-define-global "bf"     'ido-switch-buffer)
(key-chord-define-global "xf"     'ido-find-file)
(key-chord-define-global "zs"     "\C-x\C-s")
(key-chord-define-global "vc"     'vc-next-action)

(key-chord-mode +1)


(defun kill-this-buffer-if-not-modified ()
  (interactive)
  ; taken from menu-bar.el
  (if (menu-bar-non-minibuffer-window-p)
      (kill-buffer-if-not-modified (current-buffer))
    (abort-recursive-edit)))
