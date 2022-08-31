;; html标签补全
(use-package emmet-mode
  :hook
  (js-mode . emmet-mode)
  (html-mode . emmet-mode)
  (js-jsx-mode . emmet-mode)
  (typescript-mode . emmet-mode)
  :config
  (setq emmet-expand-jsx-className? t)
  )

;; 快速插入片段
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/snippets")
  )

(use-package company
  :hook
  (after-init . global-company-mode))

(use-package lsp-mode
  :hook
  (js-mode . lsp)
  (js-jsx-mode . lsp)
  (c++-mode . lsp)
  (rust-mode . lsp)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-flycheck-live-reporting nil)
  (setq lsp-diagnostics-provider nil)
  )

(use-package lsp-ui
  :config
  (setq lsp-ui-doc-enable t))

(provide 'core-completion)
