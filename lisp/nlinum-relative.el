;;; nlinum-relative.el --- display relative line number in emacs.

;; Copyright (c) 2013 Yen-Chin, Lee.
;;
;; Author: coldnew <coldnew.tw@gmail.com>
;; Keywords: converience
;; X-URL: http://github.com/coldnew/nlinum-relative
;; Version: 0.4

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; ![Screenshot](https://github.com/coldnew/nlinum-relative/raw/master/screenshot/screenshot1.jpg)
;;
;; nlinum-relative lets you display relative line numbers for current buffer.
;;

;;; Installation:

;; If you have `melpa` and `emacs24` installed, simply type:
;;
;;     M-x package-install nlinum-relative
;;
;; And add the following to your .emacs
;;
;;     (require 'nlinum-relative)

;;; Setup & Tips:

;; The non-interactive function *nlinum-on* (which should already be built into recent GNU Emacs distributions), turns on side-bar line numbering:
;;
;;     (nlinum-on)
;;
;; and alternatively, by enabling `nlinum-mode`:
;;
;;     M-x nlinum-mode
;;
;; Relative line numbering should already be enabled by default (by installing this package), following *nlinum-on* or enabling *nlinum-mode*. One can also use the *lineum-relative-toggle* interactive function to switch between relative and non-relative line numbering:
;;
;;     M-x nlinum-relative-toggle
;;

;;; Code:

(eval-when-compile (require 'cl))
(require 'nlinum)

(defgroup nlinum-relative nil
  "Show relative line numbers on fringe."
  :group 'convenience)

;;;; Faces
(defface nlinum-relative-current-face
  '((t :inherit nlinum :foreground "#CAE682" :background "#444444" :weight bold))
  "Face for displaying current line."
  :group 'nlinum-relative)

;;;; Customize Variables

(defcustom nlinum-relative-current-symbol "0"
  "The symbol you want to show on the current line, by default it is 0.
   You can use any string like \"->\". If this variable is empty string,
nlinum-releative will show the real line number at current line."
  :type 'string
  :group 'nlinum-relative)

(defcustom nlinum-relative-plusp-offset 0
  "Offset to use for positive relative line numbers."
  :type 'integer
  :group 'nlinum-relative)

(defcustom nlinum-relative-format "%3s"
  "Format for each line. Good for adding spaces/paddings like so: \" %3s \""
  :type 'strign
  :group 'nlinum-relative)

;;;; Internal Variables

(defvar nlinum-relative-last-pos 0
  "Store last position.")

;;;; Advices
(defadvice nlinum-update (before relative-nlinum-update activate)
  "This advice get the last position of nlinum."
  (setq nlinum-relative-last-pos (line-number-at-pos)))

;;;; Functions
(defun nlinum-relative (line-number)
  (let* ((diff1 (abs (- line-number nlinum-relative-last-pos)))
	 (diff (if (minusp diff1)
		   diff1
		 (+ diff1 nlinum-relative-plusp-offset)))
	 (current-p (= diff nlinum-relative-plusp-offset))
	 (current-symbol (if (and nlinum-relative-current-symbol current-p)
			     (if (string= "" nlinum-relative-current-symbol)
				 (number-to-string line-number)
			       nlinum-relative-current-symbol)
			   (number-to-string diff)))
	 (face (if current-p 'nlinum-relative-current-face 'nlinum)))
    (propertize (format nlinum-relative-format current-symbol) 'face face)))

(defun nlinum-relative-toggle ()
  "Toggle between nlinum-relative and nlinum."
  (interactive)
  (if (eq nlinum-format 'dynamic)
      (setq nlinum-format 'nlinum-relative)
    (setq nlinum-format 'dynamic)))

(setq nlinum-format 'nlinum-relative)

(provide 'nlinum-relative)
;;; nlinum-relative.el ends here.
