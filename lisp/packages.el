;; Override packages
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

;; Optimisation
(setq package-enable-at-startup nil)
(package-initialize)

;; Check packages list at startup
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar personal-packages
  '(
    ;; smartparens ;; TODO setup!
    ace-jump-mode

    deft
    ag
    ace-window ;; better other-window
    auctex
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
    flycheck-ycmd
    lua-mode)
   "A list of packages to ensure are installed at launch.")

(dolist (p personal-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
