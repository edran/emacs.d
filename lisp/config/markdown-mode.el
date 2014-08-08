(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode)) ;
;; breaks cmake-mode
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

'(markdown-command "/usr/local/bin/multimarkdown")
'(markdown-open-command "/Users/loeffler/bin/mark")
