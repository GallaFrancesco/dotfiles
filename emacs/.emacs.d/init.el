(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6bc387a588201caf31151205e4e468f382ecc0b888bac98b2b525006f7cb3307" default)))
 '(package-selected-packages
   (quote
    (bison-mode sclang-snippets sclang-extensions org-edit-latex org-evil company company-irony irony markdown-mode highlight-parentheses smart-mode-line column-enforce-mode cyberpunk-theme ranger rainbow-delimiters ## yasnippet ac-dcd d-mode magit use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "color-99"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "magenta")))))
;; load custom package manager
(load "package.el")

;; evil-leader enabled globally to SPC (BEFORE evil-mode)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "u" 'undo-tree-visualize
  "f" 'ranger
  "e" 'eval-region
  "l" 'list-buffers
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "x" 'execute-extended-command
  "c" 'comment-or-uncomment-region)

;; evil mode always on
(require 'evil)
(evil-mode t)

;; remap movement keys
(define-key evil-normal-state-map "I" nil)
(define-key evil-motion-state-map "N" 'evil-backward-char)
(define-key evil-motion-state-map "I" 'evil-forward-char)
(define-key evil-motion-state-map "E" 'evil-next-line)
(define-key evil-motion-state-map "U" 'evil-previous-line)

;; allow :W and :Q
(evil-ex-define-cmd "W" 'evil-write)
(evil-ex-define-cmd "Q" 'evil-quit)
(evil-ex-define-cmd "WQ" 'evil-save-and-close)

;; line numbers always on
(global-display-line-numbers-mode)

;; ac-dcd
(add-hook 'd-mode-hook 'ac-dcd-setup)

;; rainbow parenthesis
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; undo-tree
;; C-x u for undo-tree-visualize
(require 'undo-tree)

;; theming (cyberpunk)
(add-hook 'after-init-hook
          (lambda () (load-theme 'cyberpunk t)))

;; transparent bg
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))
(add-hook 'after-make-frame-functions 'on-frame-open)

;; 80-column-rule
(global-column-enforce-mode t)

;; disable menu bar
(menu-bar-mode -1)

;; highlight parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; C/C++ autocompletion through irony-mode and company-irony
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(global-set-key (kbd "TAB") 'company-complete)

;; no tabs for indentation
(setq-default indent-tabs-mode nil)

;; tabs are 4 spaces
(setq-default tab-stop-list (number-sequence 4 120 4))
(setq-default tab-width 4) ; or any other preferred value
(setq-default c-basic-offset 4)
(setq-default evil-shift-width 4)

;; orgmode
(global-set-key (kbd "C-l") 'org-store-link)
(global-set-key (kbd "C-a") 'org-agenda)
(global-set-key (kbd "C-c") 'org-capture)
(global-set-key (kbd "C-b") 'org-switchb)

;; supercollider (scel)
(add-to-list 'load-path "~/_progs/scel/el")
(require 'sclang)
