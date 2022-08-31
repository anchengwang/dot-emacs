;; 引入路径
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :hook
  (after-init . exec-path-from-shell-initialize))

;; 文本区域选择
(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

;; 文本注释
(use-package evil-nerd-commenter
  :config
  (global-set-key (kbd "C-;") 'evilnc-comment-or-uncomment-lines)
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-paragraphs)
  )

;; 光标快速跳转
(use-package avy
  :config
  (define-key input-decode-map (kbd "C-i") (kbd "H-i"))
  (global-set-key (kbd "H-i") 'avy-goto-char-2)
  )

;; 窗口跳转
(use-package ace-window
  :bind
  ("C--" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  ;; (setq aw-background t)
  ;; (setq aw-minibuffer-flag 1)
  ;; (setq aw-ignore-current nil)
  )

;; 彩虹括号
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode)
  :config
  ;; 选中时关闭匹配括号
  (defun paren-mode-open ()
    (show-paren-mode t)
    )
  (defun paren-mode-close ()
    (show-paren-mode -1)
    )  
  (add-hook 'activate-mark-hook #'paren-mode-close)
  (add-hook 'deactivate-mark-hook #'paren-mode-open)
  )

;; (use-package doom-modeline
;;   :hook (after-init . doom-modeline-mode)
;;   :custom
;;   (doom-modeline-icon nil)
;;   (doom-modeline-major-mode-icon nil)
;;   :config
;;   (setq doom-modeline-bar-width 1)
;;   (setq doom-modeline-buffer-file-name-style 'file-name)
;;   (setq doom-modeline-project-detection 'project)
;;   (setq doom-modeline-buffer-state-icon nil)
;;   (setq doom-modeline-minor-modes nil)
;;   (setq doom-modeline-enable-word-count nil)
;;   (setq doom-modeline-vcs-max-length 24)
;;   (setq doom-modeline-height 20)
;;   )

(use-package telephone-line
  :hook
  (after-init . telephone-line-mode)
  :config
  (defface my-red '((t (:foreground "white" :background "red"))) "")
  (defface my-orangered '((t (:foreground "white" :background "orange red"))) "")
  (defface my-orange '((t (:foreground "dim grey" :background "orange"))) "")
  (defface my-gold '((t (:foreground "dim grey" :background "gold"))) "")
  (defface my-yellow '((t (:foreground "dim grey" :background "yellow"))) "")
  (defface my-chartreuse '((t (:foreground "dim grey" :background "chartreuse"))) "")
  (defface my-green '((t (:foreground "dim grey" :background "green"))) "")
  (defface my-sgreen '((t (:foreground "black" :background "spring green"))) "")
  (defface my-cyan '((t (:foreground "dim grey" :background "cyan"))) "")
  (defface my-blue '((t (:foreground "white" :background "blue"))) "")
  (defface my-dmagenta '((t (:foreground "white" :background "dark magenta"))) "")
  (defface my-white '((t (:foreground "#000000" :background "#A1E1FF"))) "")

  (setq telephone-line-faces
        '((red . (my-red . my-red))
          (ored . (my-orangered . my-orangered))
          (orange . (my-orange . my-orange))
          (gold . (my-gold . my-gold))
          (yellow . (my-yellow . my-yellow))
          (chartreuse . (my-chartreuse . my-chartreuse))
          (green . (my-green . my-green))
          (sgreen . (my-sgreen . my-sgreen))
          (cyan . (my-cyan . my-cyan))
          (blue . (my-blue . my-blue))
          (dmagenta . (my-dmagenta . my-dmagenta))
          (white . (my-white . my-white))
          (evil . telephone-line-evil-face)
          (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
          (nil . (mode-line . mode-line-inactive))))

  (telephone-line-defsegment lsp-minor-show ()
    (let* ((workspaces (lsp-workspaces)))
      (if workspaces
          (concat "LSP->"
                  (string-join
                   (mapcar
                    (lambda (w) (format "[%s]" (lsp--workspace-print w)))
                    workspaces
                    )
                   )))))
  
  (setq telephone-line-lhs
        '(
          (ored . (telephone-line-projectile-segment))
          (sgreen . (telephone-line-vc-segment))
          (white . (telephone-line-buffer-segment))
          (nil . (lsp-minor-show))
          ))
  (setq telephone-line-rhs
        '((nil . ())
          (nil . (telephone-line-major-mode-segment))
          ))
  (setq telephone-line-height 16))
                      
(provide 'core-tools)
