(use-package ivy
  :diminish ivy-mode
  :hook
  (after-init . ivy-mode)
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x C-h") 'counsel-recentf)
  (global-set-key (kbd "C-s") 'swiper) ;; swiper-thing-at-point
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-c f") 'counsel-git-grep)
  (global-set-key (kbd "C-c C-o") 'ivy-occur)
  (global-set-key (kbd "C-x y") 'counsel-yank-pop)
  )

(use-package counsel-projectile
  :config
  (counsel-projectile-mode)
  )

;; (use-package ivy-posframe
;;   :config
;;   ;; ivy-posframe-display
;;   ;; ivy-posframe-display-at-frame-center
;;   ;; ivy-posframe-display-at-window-center
;;   ;; ivy-posframe-display-at-frame-bottom-left
;;   ;; ivy-posframe-display-at-frame-bottom-window-center
;;   ;; ivy-posframe-display-at-window-bottom-left
;;   (setq ivy-posframe-display-functions-alist
;;         '((t               . ivy-posframe-display-at-frame-center)
;;           (swiper          . ivy-display-function-fallback)))
  
  
;;   (ivy-posframe-mode 1)
;;   )

(use-package ivy-yasnippet
  :config
  (global-set-key (kbd "M-y l") 'ivy-yasnippet)
  )

;; github管理
(use-package magit
  :defer 1
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  )

;; 项目管理
(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

(use-package diredfl
  :config (diredfl-global-mode t)
  )

(provide 'core-manages)
