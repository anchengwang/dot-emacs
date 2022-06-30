(use-package posframe)

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
  :bind
  ("C-c Y" . yas-new-snippet)
  :config
  (yas-global-mode 1)
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/snippets")
  )

(add-to-list 'load-path "~/.emacs.d/libraries/lsp-bridge")
(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'core-completion)
