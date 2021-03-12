;; ----- web  {
;; --------------------------------------------------------

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

(use-package prettier-js
  :hook
  (js-jsx-mode . prettier-js-mode)
  (typescript-mode . prettier-js-mode)
  ;; :config
  ;; (add-hook 'web-mode-hook '(lambda () (unless (eq (string-match-p "\\.js$" (buffer-file-name)) nil) (prettier-js-mode))))
  ;; (setq prettier-js-command "prettier")
  ;; (setq prettier-js-args '(
  ;;                          "--trailing-comma" "all"
  ;;                          "--bracket-spacing" "true"
  ;;                          ))
  ;; (defun prettier-js-command-exchange ()
  ;;   "exchange prettier-js-command value"
  ;;   (interactive)
  ;;   (progn
  ;;     (if (string= prettier-js-command "prettier")
  ;;         (setq prettier-js-command "prettier-eslint_d")
  ;;       (setq prettier-js-command "prettier")
  ;;       )
  ;;     (message "current prettier-js-command: %s" prettier-js-command)
  ;;     )
  ;;   )
  ;; (global-set-key (kbd "C-M-\\") 'prettier-js-command-exchange)
  ;; (setq prettier-js-command "prettier-eslint_d")
  )

;; --------------------------------------------------------
;; }

;; ----- go  {
;; --------------------------------------------------------

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

;; --------------------------------------------------------
;; }

;; ----- lua  {
;; --------------------------------------------------------

(use-package lua-mode
  :config
  (setq lua-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  ) 

;; --------------------------------------------------------
;; }

;; ----- org  {
;; --------------------------------------------------------

;; 打开 org-indent mode
(setq org-startup-indented t)

(use-package valign
  :load-path "~/.emacs.d/plugins/valign"
  :hook
  (org-mode . valign-mode)
  )

;; --------------------------------------------------------
;; }

;; ----- yaml  {
;; --------------------------------------------------------

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  )

;; --------------------------------------------------------
;; }

(provide 'core-major-modes)
