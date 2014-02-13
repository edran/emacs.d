;; (add-to-list 'load-path "~/.emacd.d/vendor/auctex/")

;; (load "auctex.el" nil t t) ;; loads tex-site in such a way so that it can be undone              
;; (load "preview-latex.el" nil t t) ;; actual preview-latex   

(require 'tex)
(require 'latex)


(setq TeX-PDF-mode t)                                                                            
(setq TeX-auto-save t)                                                                           
(setq TeX-parse-self t)                                                                          
(setq-default TeX-master nil)                                                                    
(setq TeX-PDF-mode t)

;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)                                                       
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)                                                     
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)                                                      


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start flyspell

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)                               


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Outline Mode

;; C-c C-o C-l - Hide all the contents of your current section 
;; C-c C-o C-n - Next unit of document
;; C-c C-o C-p - Previous unit of document
;; C-c C-o C-a - Show all 

(require 'outline)

(defun turn-on-outline-minor-mode ()
  (outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)

(setq outline-minor-mode-prefix "\C-c \C-o")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reftex mode

;; C-c = - Invoke table

(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq LaTeX-eqnarray-label "eq"
      LaTeX-equation-label "eq"
      LaTeX-figure-label "fig"
      LaTeX-table-label "tab"
      LaTeX-myChapter-label "chap"
      TeX-auto-save t
      TeX-newline-function 'reindent-then-newline-and-indent
      TeX-parse-self t
      TeX-style-path
      '("style/" "auto/"
	"/usr/share/emacs24/site-lisp/auctex/style/"
	"/var/lib/auctex/emacs24/"
	"/usr/local/share/emacs/site-lisp/auctex/style/")
      LaTeX-section-hook
      '(LaTeX-section-heading
	LaTeX-section-title
	LaTeX-section-toc
	LaTeX-section-section
	LaTeX-section-label))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Preview-latex

;; C-c C-p C-p             - ‘Preview/at point’
;; C-h i d m preview-latex - info
;; C-c C-p <TAB>           - info
;; C-c C-p C-r             - preview-region
