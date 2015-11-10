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
    dash ;; Modern list library
    ;; -------------------------------
    ace-jump-mode ;; Jump everywhere (see general.el)
    deft ;; useful for todo
    ag ;; pattern search engine
    ace-window ;; better other-window
    auctex ;; TeX
    browse-kill-ring ;; better kill-ring
    cmake-mode ;; CMake mode
    column-enforce-mode ;; Highlight long text (see look.el)
    company ;; Company mode
    company-c-headers ;; Complete c-headers
    anaconda-mode ;; Python suite
    company-anaconda ;; Company frontend for Anaconda
    diminish ;; Cleaner modes
    expand-region ;; Expand selected region
    fill-column-indicator ;; Produce column line at defined column
    flycheck ;; Check for errors
    git-gutter-fringe+ ;; Git status in each buffer
    google-c-style ;; Google c/c++ style
    guide-key ;; Show suggestions for keychains
    god-mode ;; GOD MODE HELL YEAH
    helm ;; Ido replacement
    helm-projectile ;; Make helm work with projectile
    helm-ag ;; Make helm work with ag
    iedit ;; Edit same text everywhere - `C-;` :)
    key-chord ;; Use key-chords for commands
    magit ;; Awesome git mode
    markdown-mode ;; Markdown mode
    moe-theme ;; Colourful theme!
    multiple-cursors ;; Sublime-text like multiple cursors
    neotree ;; Nerdtree like package (press f8)
    nlinum ;; Number lines in every buffer
    powerline ;; Better emacs line
    projectile ;; Better project management
    rainbow-delimiters ;; Colourful parentheses!
    rainbow-identifiers ;; Colourful words for programming!
    rainbow-mode ;; Colour strings in theme elisp files
    paradox ;; Better list-package page
    undo-tree ;; Better editing history management
    whitespace-cleanup-mode ;; Cleanup smartly
    perspective ;; Workspaces within emacs
    writeroom-mode ;; Distraction-free editing
    yasnippet ;; Snippets
    lua-mode ;; Lua mode
    virtualenvwrapper ;; Implement virtualenvwrapper
    )
  "A list of packages to ensure they are installed at launch.")

(dolist (p personal-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
