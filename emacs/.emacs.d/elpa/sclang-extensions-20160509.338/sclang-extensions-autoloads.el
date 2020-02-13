;;; sclang-extensions-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "sclang-ac-mode" "sclang-ac-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from sclang-ac-mode.el

(autoload 'sclang-electric-dot "sclang-ac-mode" "\
Insert a dot and access members for the sclang expr before point.

\(fn)" t nil)

(autoload 'sclang-ac-mode "sclang-ac-mode" "\
Minor mode that provides more intelligent auto-complete behaviour for SuperCollider.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sclang-ac-mode" '("scl")))

;;;***

;;;### (autoloads nil "sclang-doc-mode" "sclang-doc-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from sclang-doc-mode.el

(autoload 'sclang-doc-mode "sclang-doc-mode" "\
Displays minibuffer documentation for the SuperCollider symbol at point.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sclang-doc-mode" '("scl")))

;;;***

;;;### (autoloads nil "sclang-extensions" "sclang-extensions.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from sclang-extensions.el

(autoload 'sclang-eval-last-expression "sclang-extensions" "\
Evaluate the sclang expression before point.

\(fn)" t nil)

(autoload 'sclang-expression-start "sclang-extensions" "\
Move to the start of the sclang expression before point.

\(fn)" t nil)

(autoload 'sclang-eval-dwim "sclang-extensions" "\
Perform a context-sensitive evaluation action.
Either eval the current region or the top level grouping at point.

\(fn)" t nil)

(defvar sclang-extensions-mode-map (let ((km (make-keymap))) (define-key km (kbd "M-a") 'sclang-expression-start) (define-key km (kbd "C-x C-e") 'sclang-eval-last-expression) (define-key km (kbd "C-c C-c") 'sclang-eval-dwim) (define-key km (kbd "C-c C-z") 'sclang-switch-to-post) (define-key km (kbd "M-q") 'indent-buffer) (define-key km (kbd "s-.") 'sclang-main-stop) (define-key km (kbd "C-c C-l") 'sclang-eval-document) km))

(autoload 'sclang-switch-to-post "sclang-extensions" "\
Switch between the Post buffer and the last sclang buffer.

\(fn)" t nil)

(autoload 'sclang-switch-to-src "sclang-extensions" "\
Switch to the last sclang source file.

\(fn)" t nil)

(autoload 'sclang-post-buffer-mode "sclang-extensions" "\
Major mode for sclang post buffer.

\(fn)" t nil)

(autoload 'sclang-extensions-mode "sclang-extensions" "\
Enable all extensions to the sclang Emacs mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sclang-extensions" '("scl")))

;;;***

;;;### (autoloads nil "sclang-extensions-utils" "sclang-extensions-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from sclang-extensions-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sclang-extensions-utils" '("scl")))

;;;***

;;;### (autoloads nil "sclang-post-mode" "sclang-post-mode.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from sclang-post-mode.el

(autoload 'sclang-post-mode "sclang-post-mode" "\
Minor-mode that displays messages from SuperCollider in the minibuffer.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sclang-post-mode" '("scl")))

;;;***

;;;### (autoloads nil nil ("sclang-extensions-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sclang-extensions-autoloads.el ends here
