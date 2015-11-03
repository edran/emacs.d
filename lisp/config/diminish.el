(require 'diminish)

(defun me/diminish (str mode &optional arg)
  (eval-after-load str
    '(diminish mode arg)))

(me/diminish "yasnippet" 'yas-minor-mode " Y")
(me/diminish "undo-tree" 'undo-tree-mode " UT")
(me/diminish "guide-key" 'guide-key-mode)
(me/diminish "projectile" 'projectile-mode " Proj")
(me/diminish "git-gutter+" 'git-gutter+-mode)
(me/diminish "company" 'company-mode " C")
(me/diminish "helm" 'helm-mode)
(me/diminish "whitespace-cleanup-mode" 'whitespace-cleanup-mode)
(me/diminish "column-enforce-mode" 'column-enforce-mode)
