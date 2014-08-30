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

(defvar personal-packages
  '(flycheck
    flycheck-color-mode-line
    flycheck-haskell
    flycheck-pos-tip
    auto-complete
    ghc
    moe-theme
    ghci-completion
    auctex
    flx-ido
    markdown-mode
    haskell-mode
    web-mode
    guru-mode
    whitespace-cleanup-mode
    fill-column-indicator
    epc
    python-environment
    column-enforce-mode
    jedi
    python-django
    smartrep
    ein
    yasnippet
    auto-complete-auctex
    auto-complete-clang
    ;; autopair
    ;; smartparens
    ecb
    expand-region
    projectile
    smooth-scrolling
    ;; smooth-scroll
    edit-server
    ag
    info+
    help+
    help-mode+
    org-ac
    smex
    browse-kill-ring
    undo-tree
    magit
    smart-mode-line
    cmake-mode
    cpputils-cmake
    auto-complete-clang-async
    auto-complete-c-headers
    auto-complete-chunk
    iedit
    ido-ubiquitous
    ido-vertical-mode
    howdoi
    cmake-project
    helm
    ;; god-mode
    buffer-move
    nlinum
    linum-relative
    pos-tip
    powerline
    key-chord
    ace-jump-mode
    ace-window
    rainbow-mode
    rainbow-delimiters
    rainbow-identifiers
    multiple-cursors
    ido-at-point
    guide-key
    diminish
    hi2
    neotree
    git-gutter-fringe+
    dired+
    dired-details+
    dash)
   "A list of packages to ensure are installed at launch.")

(dolist (p personal-packages)
  (when (not (package-installed-p p))
    (package-install p)))
