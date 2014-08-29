(require 'dired+)

;; Also auto refresh dired, but be quiet about it
(require 'autorevert)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files ".hi$\\|\\.o$")

;; Make dired less verbose
(require 'dired-details)
(require 'dired-details+)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

;; Move files between split panes
(setq dired-dwim-target t)

(toggle-diredp-find-file-reuse-dir 1)
