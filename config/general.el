;; Shut up compile saves
(setq compilation-ask-about-save nil)
;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))

;; To refactor
(setq default-directory "~/")
(delete-selection-mode 1) ; delete seleted text when typing
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(recentf-mode 1) ; keep a list of recently opened files
(setq line-move-visual nil) ; use t for true, nil for false

;; add newline with c-n at EOL
(setq next-line-add-newlines t)
