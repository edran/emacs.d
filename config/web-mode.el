(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'web-mode-hook)

;; TODO - Add smartparens
;; (defun web-mode-hook ()
;;   (setq web-mode-disable-auto-pairing t))

;; (add-hook 'web-mode-hook  'web-mode-hook)

;; (defun sp-web-mode-is-code-context (id action context)
;;   (when (and (eq action 'insert)
;;              (not (or (get-text-property (point) 'part-side) 
;;                       (get-text-property (point) 'block-side))))

;;     t))
;; (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))
