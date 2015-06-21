;;; package -- Summary:
;;; Commentary:

(require 'package)

;;; Code:

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Check packages at startup

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar personal-packages
  '(
    ;; autopair
    ;; erc-colorize
    ;; erc-hl-nicks
    ;; erc-image
    ;; erc-tweet
    ;; erc-youtube
    ;; smartparens
    ;; smooth-scroll
    ace-jump-mode
    deft
    ace-window
    ag
    auctex
    ;; auto-complete
    ;; auto-complete-auctex
    ;; auto-complete-c-headers
    ;; auto-complete-chunk
    ;; auto-complete-clang
    ;; auto-complete-clang-async
    browse-kill-ring
    buffer-move
    cmake-mode
    cmake-project
    column-enforce-mode
    company
    company-c-headers
    company-irony
    anaconda-mode
    company-anaconda
    cpputils-cmake
    dash
    diminish
    dired+
    dired-details+
    ecb
    edit-server
    ein
    epc
    expand-region
    fill-column-indicator
    flx-ido
    flycheck
    flycheck-color-mode-line
    flycheck-haskell
    flycheck-irony
    flycheck-pos-tip
    fuzzy
    ggtags
    ghc
    ghci-completion
    git-gutter-fringe+
    google-c-style
    guide-key
    guru-mode
    god-mode
    haskell-mode
    helm
    helm-projectile
    helm-ag
    help+
    help-mode+
    hi2
    howdoi
    ido-at-point
    ido-ubiquitous
    ido-vertical-mode
    iedit
    info+
    irony
    ;; jedi
    key-chord
    linum-relative
    magit
    markdown-mode
    moe-theme
    multiple-cursors
    neotree
    nlinum
    ;; org-ac
    pos-tip
    powerline
    projectile
    python-django
    python-environment
    rainbow-delimiters
    rainbow-identifiers
    rainbow-mode
    smart-mode-line
    smartrep
    smex
    smooth-scrolling
    undo-tree
    virtualenvwrapper
    web-mode
    whitespace-cleanup-mode
    writegood-mode
    writeroom-mode
    yasnippet
    znc
    ycmd
    flycheck-ycmd)
   "A list of packages to ensure are installed at launch.")

(dolist (p personal-packages)
  (when (not (package-installed-p p))
    (package-install p)))
