;;; package -- Summary:
;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Switch keys to go to indentation instead starting line
;; (global-set-key (kbd "C-a") 'back-to-indentation)
;; (global-set-key (kbd "C-S-a") 'beginning-of-visual-line)
;; (global-set-key (kbd "M-m") 'beginning-of-visual-line)

;; Return to CTRL-R gives this annoying warning
;; PROTIP: in .xinitrc:
;; xmodmap -e 'keycode 36 = 0x1234'
;; xmodmap -e 'add control = 0x1234'
;; xmodmap -e 'keycode any = Return'
;; ./xcape -e '0x1234=Return'
(global-set-key (kbd "<key-4660>") 'ignore)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

(setq scroll-conservatively 10000)

;; Better isearch
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
      (when (and isearch-forward isearch-other-end
                 (not isearch-mode-end-hook-quit))
        (goto-char isearch-other-end)))

(defadvice isearch-exit (after my-goto-match-beginning activate)
      "Go to beginning of match."
      (when (and isearch-forward isearch-other-end)
        (goto-char isearch-other-end)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyset for switching between frames

;;(global-set-key (kbd "s-<left>")  'windmove-left)
;; (global-set-key (kbd "s-<right>") 'windmove-right)
;; (global-set-key (kbd "s-<up>")    'windmove-up)
;; (global-set-key (kbd "s-<down>")  'windmove-down)

;; (defun back-window ()
;;   "This is basically the opposite of 'other-window'."
;;   (interactive)
;;   (other-window -1))

;; (global-set-key [s-j] 'other-window)
;; (global-set-key [s-k] 'back-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define keys to resize windows
;; TODO check if those should go to general or look
(global-set-key (kbd "s-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>")  'shrink-window)
(global-set-key (kbd "s-C-<up>")    'enlarge-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Scrolling down
(global-set-key (kbd "M-n")    'scroll-up-line)
(global-set-key (kbd "M-p")    'scroll-down-line)

(global-set-key [f8] 'neotree-toggle)

(defun me/vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer)
  )
(defun me/hsplit-last-buffer ()
  (interactive)
   (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer)
  )

(global-set-key (kbd "C-x 2") 'me/vsplit-last-buffer)
(global-set-key (kbd "C-x 3") 'me/hsplit-last-buffer)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key (kbd "M-P")     'buf-move-up)
(global-set-key (kbd "M-N")   'buf-move-down)
(global-set-key (kbd "M-B")   'buf-move-left)
(global-set-key (kbd "M-F")  'buf-move-right)

(global-set-key (kbd "C-C C-C") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(put 'set-goal-column 'disabled nil)
