;;;
;;; $Id: guile-interface.el,v 1.11 1997/06/19 22:10:56 mcmanr Exp $
;;;

(defun guile-send-header-forms ()
  "go to the top of the buffer and examine top level 
forms.  send header forms to the inferior scheme process.
header forms are forms involving the guile module system
and forms to load code from slib.  quit searching when
a non-header form is encountered."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (forward-list 1)
    (forward-list -1)
    (while (or (looking-at "(define-module")
	       (looking-at "(set-current-module")
	       (looking-at "(use-modules")
	       (looking-at "(require"))
      (lisp-eval-defun)
      (forward-list 2)
      (forward-list -1))))

(defun guile-send-definition ()
  "Sends header forms, then the currrent definition,
to the inferior scheme process,"
  (interactive)
  (guile-send-header-forms)
  (lisp-eval-defun))

(defun guile-send-region ()
  "Sends header forms, then the current region to the 
inferior scheme process.  also send a silly form on the
end to make sure that the reader is not hanging waiting
on white space."
  (interactive)
  (let ((buf (current-buffer)))
    (guile-send-header-forms)
    (lisp-eval-region (point) (mark))
    (comint-send-string 
     (get-process "inferior-lisp") 
     "(quote done-sending-region)\n")))

(defun guile-run-lisp ()
  "wrapper around run-lisp from inf-lisp.el, that does some
snazzy buffer switching."
  (interactive "")
  (if (not (eq (process-status "inferior-lisp") 'run))
      (let ((start-buf (current-buffer)))
	(run-lisp inferior-lisp-program)
	(switch-to-buffer start-buf))
    (let ((start-buf (current-buffer))
	  (lisp-buf (get-buffer "*inferior-lisp*")))
      (switch-to-buffer-other-window lisp-buf)
      (goto-char (point-max))
      (switch-to-buffer-other-window start-buf))))

(defun guile-procedure-documentation ()
  "get the inferior lisp process to print the doc string
of the procedure whose name is under point.  this involves
first setting the current module."
  (interactive)
  (guile-run-lisp)
  (guile-send-header-forms)
  (save-excursion
    (let ((process (get-process "inferior-lisp")))
      (backward-sexp)
      (set-mark (point))
      (forward-sexp 1)
      (let ((str (buffer-substring (point) (mark))))
	(comint-send-string 
	 process 
	 (concat
	  "(begin "
	  "  (newline)"
	  "  (display " str ")"
	  "  (newline)"
	  "  (procedure-documentation " str "))\n"))))))

;;;
;;; scheme mode customization
;;;
(setq inferior-lisp-program "/usr/bin/guile")


(defvar menu-bar-my-scheme-menu (make-sparse-keymap "Scheme"))
(define-key menu-bar-my-scheme-menu [my-scheme-run-scheme]
  '("Run Scheme" . guile-run-lisp))

(defun my-scheme-mode-hook ()
  (turn-on-font-lock)
  (define-key scheme-mode-map (read-kbd-macro "C-c r") 'guile-send-region)
  (define-key scheme-mode-map (read-kbd-macro "C-c e") 'guile-send-definition)
  (define-key scheme-mode-map (read-kbd-macro "C-c d") 'guile-procedure-documentation)
  (define-key scheme-mode-map (read-kbd-macro "C-c x") 'guile-run-lisp))

(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)

(provide 'guile-interface)
