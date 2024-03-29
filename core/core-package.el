(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package)
  )
(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

(provide 'core-package)


