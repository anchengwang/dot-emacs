(add-to-list 'auto-mode-alist '("\\.wxml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.wxss\\'" . css-mode))

(setq js-indent-level 2)
(setq css-indent-offset 2)
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js-jsx-mode))

(use-package typescript-mode
  :config
  (setq typescript-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))
  )

(use-package vue-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
  )

(use-package prettier-js
  :hook
  (typescript-mode . prettier-js-mode)
  (js-mode . prettier-js-mode)
  (js-jsx-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '("--print-width" "100"))
  )

(use-package go-mode
  :defer 1
  :hook
  (before-save . gofmt-before-save)
  (go-mode . (lambda () (setq tab-width 2)))
  :config
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  (when (executable-find "goimports")
    (setq gofmt-command "goimports"))
  )

(use-package lua-mode
  :config
  (setq lua-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  ) 

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))
  )

(use-package glsl-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
  )

(use-package nginx-mode
  :config
  (add-to-list 'auto-mode-alist '("/nginx/sites-\\(?:available\\|enabled\\)/" . nginx-mode))
  (setq nginx-indent-level 2)
  )

(use-package rust-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  (setq rust-format-on-save t)
  (setq rust-indent-offset 2)
  (add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
  )

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(provide 'core-major-modes)
