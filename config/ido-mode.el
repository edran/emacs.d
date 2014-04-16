(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

;; Make ido guess the context for FFAP
(setq ido-use-filename-at-point 'guess) 
;; Always create a new buffer if name doesn't match
(setq ido-create-new-buffer 'always)
;; files to emphasize
(setq ido-file-extensions-order '(".org" ".md" ".py" ".h" ".cpp" ".c" ".hs" ".emacs" ".el"))

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)


;; Ignore some extensions (check completion-ignored-extensions)
 (setq ido-ignore-extensions t) 

;; C-b	Reverts to the old switch-buffer completion engine	Buffers
;; C-f	Reverts to the old find-file completion engine	Files
;; C-d	Opens a dired buffer in the current directory	Dirs / Files
;; C-a	Toggles showing ignored files (see ido-ignore-files)	Files / Buffers
;; C-c	Toggles if searching of buffer and file names should ignore case. (see ido-case-fold)	Dirs / Files / Buffers
;; TAB	Attempt to complete the input like the normal completing read functionality	Dirs / Files / Buffers
;; C-p	Toggles prefix matching; when it’s on the input will only match the beginning of a filename instead of any part of it.	Files
;; C-s / C-r	Moves to the next and previous match, respectively	All
;; C-t	Toggles matching by Emacs regular expression.	All
;; Backspace	Deletes characters as usual or goes up one directory if it makes sense to do so.	All (but functionality varies)
;; C-SPC / C-@	Restricts the completion list to anything that matches your current input. (Thanks to Joakim Hårsman for pointing it out)	All
;; //	Like most *nix shells two forward slashes in a path means “ignore the preceding path, and go back to the top-most directory”. Works the same in Ido but it’s more interactive: it will go to the root / (or the root of the current drive in Windows)	Files
;; ~/	Jumps to the home directory. On Windows this would be typically be %USERPROFILE% or %HOME%, if it is defined.
;; Files / Dirs
;; M-d	Searches for the input in all sub-directories to the directory you’re in.	Files
;; C-k	Kills the currently focused buffer or deletes the file depending on the mode.	Files / Buffers
;; M-m	Creates a new sub-directory to the directory you’re in	Files
