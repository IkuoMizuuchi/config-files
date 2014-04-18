;; -*- Mode: Emacs-Lisp -*-
;;
;;	$Id: .emacs 4143 2014-03-09 12:48:03Z ikuo $
;;

(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

(defun load-if-exists (&rest args)
  (if (file-exists-p (car args))
      (apply #'load args)))

(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
 "Japanese"
 'coding-priority (cons 'utf-8
			(get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
;(set-terminal-coding-system 'iso-2022-jp)

(if (featurep 'meadow)
    (load-if-exists "~/.meadow")
  (load-if-exists "~/.emacs21"))

(display-time)

;; common settings by ikuo
(global-set-key "\C-x4\C-r" 'find-file-read-only-other-window)
(global-set-key "\C-x5\C-r" 'find-file-read-only-other-frame)
(global-set-key "\C-c\C-w" 'compare-windows)
;;;


;;
;;comma,period <--> ten,maru
;;
(defun change-maru-piri ()
  (interactive)
  (ten-comma)
  (maru-piri))
(defun change-piri-maru ()
  (interactive)
  (comma-ten)
  (piri-maru))
(defun maru-piri ()
  (interactive)
  (let ((pos (point)))
    (goto-line 1)
    (replace-string "。" "．" nil)
    (goto-char pos)))
(defun ten-comma ()
  (interactive)
  (let ((pos (point)))
    (goto-line 1)
    (replace-string "、" "，" nil)
    (goto-char pos)))
(defun piri-maru ()
  (interactive)
  (let ((pos (point)))
    (goto-line 1)
    (replace-string "．" "。" nil)
    (goto-char pos)))
(defun comma-ten ()
  (interactive)
  (let ((pos (point)))
    (goto-line 1)
    (replace-string "，" "、" nil)
    (goto-char pos)))

;;
;;key
;;
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\er" 'replace-string)
(define-key global-map "\C-m" 'newline-and-indent)
(define-key lisp-mode-map "\C-m" 'reindent-then-newline-and-indent)
(define-key esc-map "g" 'goto-line)
(define-key esc-map "m" 'set-mark-command)
(define-key esc-map "o" 'change-maru-piri)
(define-key esc-map "p" 'fill-paragraph)
(define-key global-map "\C-\]" 'undo)

;;
;; comment-region s
;;
(define-key emacs-lisp-mode-map       "\C-c\C-c" 'comment-region)
(define-key lisp-interaction-mode-map "\C-c\C-c" 'comment-region)
(define-key lisp-mode-map             "\C-c\C-c" 'comment-region)
(add-hook 'asm-mode-hook
	  (function
	   (lambda ()
	     (define-key asm-mode-map              "\C-c\C-c" 'comment-region)
	     )))
(add-hook 'c-mode-hook
	  (function
	   (lambda () 
	     (define-key c-mode-map "\C-c\C-c" 'comment-region)
	     (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
	     (define-key c-mode-map "\C-c\C-w" 'compare-windows)
	     )))
(add-hook 'c++-mode-hook
	  (function
	   (lambda () 
	     (define-key c++-mode-map "\C-c\C-c" 'comment-region)
	     (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
	     (define-key c++-mode-map "\C-c\C-w" 'compare-windows)
	     )))
(add-hook 'perl-mode-hook
	  (function
	   (lambda ()
	     (define-key perl-mode-map             "\C-c\C-c" 'comment-region)
	     )))
(add-hook 'shell-script-mode-hook
	  (function
	   (lambda ()
	     (define-key sh-mode-map               "\C-c\C-c" 'comment-region)
	     )))
(add-hook 'tex-mode-hook
	  (function
	   (lambda ()
	     (define-key tex-mode-map              "\C-c\C-c" 'comment-region)
	     (define-key text-mode-map             "\C-c\C-c" 'comment-region)
	     )))
(add-hook 'html-helper-mode-hook
	  (function
	   (lambda ()
	     (define-key html-helper-mode-map "\C-c\C-c" 'comment-region)
	     )))
(add-hook 'fortran-mode-hook
	  (function
	   (lambda ()
	     (define-key fortran-mode-map "\C-c\C-c" 'fortran-comment-region)
	     )))
(add-hook 'make-mode-hook
	  (function
	   (lambda ()
	     (define-key makefile-mode-map  "\C-c\C-c" 'comment-region)
	     )))
(add-hook 'makefile-mode-hook
	  (function
	   (lambda ()
	     (define-key makefile-mode-map  "\C-c\C-c" 'comment-region)
	     )))

;;; When in Text mode, want to be in Auto-Fill mode.
;;;
(defun my-auto-fill-mode nil (auto-fill-mode 1))
(add-hook 'text-mode-hook 'my-auto-fill-mode)
(add-hook 'mail-mode-hook 'my-auto-fill-mode)

;; euslisp-mode.el
(if (file-exists-p "~/euslisp-mode.el")
    (load "~/euslisp-mode.el"))

(setq auto-save-list-file-prefix "~/.saves/")

;;; Lisp indent style
(put 'dolist 'lisp-indent-hook 1)
(put 'when 'lisp-indent-hook 1)
(put 'eval-when 'lisp-indent-hook 1)
(put 'cond 'lisp-indent-hook 1)
(put 'dotimes 'lisp-indent-hook 1)
(put 'with-open-file 'lisp-indent-hook 1)
(put 'with-open-file-with-lock 'lisp-indent-hook 1)

;;; When in C-mode, want all bells and whistles...
; (setq c-auto-newline nil)
(setq c-tab-always-indent t)
; (setq c-indent-level 2)
; (setq c-continued-statement-offset 2)
; (setq c-brace-offset 0)
; (setq c-brace-imaginary-offset 0)
; (setq c-argdecl-indent 0)
; (setq c-label-offset -2)

(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (c-toggle-hungry-state 1)
	     (setq c-basic-offset 4)
	     (setq tab-width 4)
;; 	     (setq indent-tabs-mode nil);;no using tab chars
	     (setq indent-tabs-mode t);;using tab chars
	     ))

;; for changelog
;; http://www.namazu.org/~satoru/unimag/1/
(setq user-full-name "Ikuo Mizuuchi")
; (setq user-mail-address "mizuuchi@cc.tuat.ac.jp")
(defun memo ()
  (interactive)
    (add-change-log-entry 
     nil
     (unless (file-exists-p "ChangeLog")
       (if (file-exists-p "~/tuat/doc/ChangeLog")
	   (expand-file-name "~/tuat/doc/ChangeLog")
	 (expand-file-name "~/ChangeLog")))))
(global-set-key "\C-cl" 'memo)
;;

;(global-font-lock-mode)
(if (not (boundp 'font-lock-preprocessor-face))
    (setq font-lock-preprocessor-face font-lock-reference-face))

;; php-mode-1.5.0
(require 'cc-mode)
;(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)

(defun paste-from-moodle ()
  (interactive)
  (let ((pos (point)))
    (goto-line 1)
    (replace-string "＜" "<" nil)
    (goto-line 1)
    (replace-string "＞" ">" nil)
    (indent-region 1 (count-lines 1 (point-max)) nil)
    (goto-char pos)
    ))

(add-hook 'html-helper-mode-hook
	  '(lambda () (setq tab-width 2)))

