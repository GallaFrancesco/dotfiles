 ;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

 ;; require use-package
(eval-when-compile
  (require 'use-package))

;; require various packages to be installed
;; automatically start it on emacs startup
(use-package projectile :ensure t)
(use-package magit :ensure t)
(use-package evil :ensure t)
(use-package d-mode :ensure t)
(use-package yasnippet :ensure t)
(use-package popwin :ensure t)
(use-package ac-dcd :ensure t)
