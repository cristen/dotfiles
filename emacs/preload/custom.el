;;; Custom --- Summary

;;; Commentary:
;;; Code:

(require 'prelude-packages)
(prelude-require-packages '(jsx-mode
                            jinja2-mode
                            multiple-cursors
                            flycheck-pyflakes
                            ag))


;; (require 'jsx-mode)
;; (require 'jinja2-mode)



;; JS
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)


;; Jinja2
(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . jinja2-mode))
(autoload 'jinja2-mode "jinja2-mode" "Jinja2 mode" t)

(provide 'custom)
;;; custom.el ends here
