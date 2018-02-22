(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" default)))
 '(fci-rule-color "#383838")
 '(magit-diff-arguments (quote ("--function-context" "--no-ext-diff" "--stat")))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (markdown-mode+ markdown-preview-eww easy-jekyll csv-mode php-mode markdown-mode yaml-mode anaconda-mode jedi py-yapf auto-package-update iy-go-to-char ivy-youtube plsql github-browse-file sass-mode zop-to-char zenburn-theme which-key web-mode volatile-highlights undo-tree soothe-theme solarized-theme smex smartrep smartparens smart-mode-line scss-mode rainbow-mode rainbow-delimiters py-isort projectile ov operate-on-number multiple-cursors move-text magit jsx-mode json-mode js2-mode jinja2-mode imenu-anywhere ido-ubiquitous guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck-pyflakes flx-ido expand-region elisp-slime-nav easy-kill discover-my-major diminish diff-hl crux company-anaconda coffee-mode browse-kill-ring beacon anzu ag ace-window)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(sp-override-key-bindings (quote (("M-<down>") ("M-<up>"))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; This uses the venv default binaries
(add-to-list 'exec-path ".env/bin/")

(require 'electric)
(require 'py-yapf)
;; CUSTOM config
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "fr_FR.UTF-8")
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(scroll-bar-mode -1)

;; CUSTOM functions
(defun wrap-html-tag ()
  "Add a tag to beginning and ending of current word or text selection."
  (interactive)
  (save-excursion
    (backward-word)
    (setq bounds (bounds-of-thing-at-point 'word))
    (setq start (car bounds))
    (setq end (cdr bounds))
    (setq textVal (thing-at-point 'word))
    (goto-char start) (insert "<")
    (goto-char end) (forward-char)(insert "></" textVal ">"))
  (forward-char))

(defun wdb()
  "Add a wdb statement."
  (interactive)
  (insert "import wdb;wdb.set_trace()"))

(defun jinja2-mode-config()
  "For use with jinja2 mode"
  (local-set-key (kbd "C-j") 'wrap-html-tag))

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun custom-python-mode-defaults ()
  "Defaults for Python programming."
  (subword-mode +1)
  (anaconda-mode 1)
  (eldoc-mode 1)
  (local-set-key (kbd "M-p") 'python-nav-backward-block)
  (local-set-key (kbd "M-n") 'python-nav-forward-block)
  (setq-local electric-layout-rules
              '((?: . (lambda ()
                        (and (zerop (first (syntax-ppss)))
                             (python-info-statement-starts-block-p)
                             'after)))))
  (when (fboundp #'python-imenu-create-flat-index)
    (setq-local imenu-create-index-function
                #'python-imenu-create-flat-index))
  (add-hook 'post-self-insert-hook
            #'electric-layout-post-self-insert-function nil 'local))

(global-set-key (kbd "M-SPC") 'hippie-expand)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "<C-down>") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "<C-up>") (lambda ()
                                 (interactive)
                                 (kill-whole-line)
                                 (previous-line)
                                 (end-of-line)))
(global-set-key (kbd "C-.") 'backward-kill-line)
(global-set-key (kbd "M-<") (lambda () (interactive) (goto-char 0)))

(global-set-key (kbd "<f7>") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "<f8>") 'mc/edit-lines)
(global-set-key (kbd "<f9>") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "<f10>") 'mc/mark-all-like-this)
(global-set-key (kbd "<M-down>") 'move-text-down)
(global-set-key (kbd "<M-up>") 'move-text-up)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(setq prelude-flyspell nil)


;; PYTHON
(defun py-isort-after-save-hook ()
  (when (eq major-mode 'python-mode)
    (py-isort-buffer)))

(setq prelude-python-mode-hook 'custom-python-mode-defaults)
(add-hook 'after-save-hook #'py-isort-after-save-hook)
(add-to-list 'load-path "/home/cristen/.config/python/python.yapf")
(require 'py-yapf)


;; JINJA2
(add-hook 'jinja2-mode-hook 'jinja2-mode-config)
(define-key prelude-mode-map (kbd "C-c t") 'jinja2-insert-tag)
(define-key prelude-mode-map (kbd "C-c v") 'jinja2-insert-var)
(provide 'custom)
;;; custom.el ends here
