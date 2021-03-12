(use-package company
  :hook
  (after-init . global-company-mode)
  :init
  (setq company-backends
        '(
          company-capf
          company-dabbrev-code
          company-keywords
          company-files
          company-css
          company-dabbrev
          )
        )
  :bind
  (
   ;; ("M-/" . company-complete)
   :map company-active-map
   ("C-p" . company-select-previous)
   ("C-n" . company-select-next)
   ("<tab>" . company-complete-common-or-cycle)
   :map company-search-map
   ("C-p" . company-select-previous)
   ("C-n" . company-select-next))
  :config
  (setq
   company-tooltip-limit 20
   company-tooltip-align-annotations t
   company-dabbrev-other-buffers 'all
   ;; t means search buffers with same major mode
   company-dabbrev-code-other-buffers t
   company-dabbrev-code-ignore-case nil
   company-dabbrev-ignore-case nil
   company-dabbrev-downcase nil
   company-minimum-prefix-length 1
   company-idle-delay 0
   company-require-match nil)
  )

(use-package company-box
  :hook (company-mode . company-box-mode))

;; html标签补全
(use-package emmet-mode
  :hook
  (js-mode . emmet-mode)
  (html-mode . emmet-mode)
  (js-jsx-mode . emmet-mode)
  (typescript-mode . emmet-mode)
  :config
  (define-key emmet-mode-keymap (kbd "C-j") 'emmet-expand-line)
  ;; (setq emmet-expand-jsx-className? t)
  )

;; 快速插入片段
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/snippets")
  (global-set-key (kbd "M-y n") 'yas-new-snippet)
  )

;; ----- lsp补全  {
;; --------------------------------------------------------

(use-package lsp-mode
  ;; :hook
  ;; (js-jsx-mode . lsp)
  ;; (typescript-mode . lsp)
  )

;; lsp optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; --------------------------------------------------------
;; }

(provide 'core-completion)
