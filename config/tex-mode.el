;; (add-to-list 'load-path "~/.emacd.d/vendor/auctex/")

(load "auctex.el" nil t t) ;; loads tex-site in such a way so that it can be undone              
(load "preview-latex.el" nil t t) ;; actual preview-latex   

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

;; (setq reftex-plug-into-AUCTeX t)
;; (setq TeX-view-program-list '(("Shell Default" "open %o")))                                      
;; (setq TeX-view-program-selection '((output-pdf "Shell Default")))                                


