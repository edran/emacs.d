;;; package -- Summary:
;;; Commentary:

(require 'package)

;;; Code:

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Check packages at startup

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar prelude-packages
  '(flycheck
    flycheck-color-mode-line
    auto-complete
    ghc
    ghci-completion
    auctex
    markdown-mode
    haskell-mode
    web-mode
    guru-mode
    whitespace-cleanup-mode
    fill-column-indicator
    epc
    python-environment
    jedi
    python-django
    smartrep
    ein
    yasnippet)
   "A list of packages to ensure are installed at launch.")

(dolist (p prelude-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages.el ends here
