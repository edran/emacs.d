(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x r" "C-x 4" "C-x v" "C-x 8" "C-u"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(setq guide-key/highlight-command-regexp "rectangle")
(setq guide-key/idle-delay 1)