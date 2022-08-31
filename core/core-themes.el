;; 中英文字体设置
;; Inconsolata |  Yuppy TC | Wawati SC | Ayuthaya
(set-face-attribute 'default nil :font "Inconsolata 14")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "WenQuanYi Micro Hei" :size 12)))
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-scroll-bar-mode nil)   
(setq-default cursor-type 'bar)
(setq-default line-spacing 0.2)

(global-linum-mode 1)
(setq linum-format "%4d ")

(use-package all-the-icons
  :if (display-graphic-p)
  )

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic nil)
  ;; (load-theme 'doom-solarized-light t)
  ;; (load-theme 'doom-nord-light t)
  (load-theme 'doom-acario-light t)
  ;; (load-theme 'doom-one-light t)
  )

(provide 'core-themes)
