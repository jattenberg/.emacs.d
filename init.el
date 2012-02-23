(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/auto-complete")

(ido-mode t)

(require 'php-mode)
(require 'auto-complete-config)
(require 'color-theme)
(require 'yaml-mode)
(require 'flymake)
(load '"color-theme-sunburst")
(autoload 'scss-mode "scss-mode")
(setq-default truncate-lines t)
(setq make-backup-files nil)

;; Associate files with extensions
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.mako$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")

(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)
(global-set-key [f5] '(lambda () (interactive) (revert-buffer nil t nil)))

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-sunburst)
))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-progressive-speed nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(defun pear/php-mode-init()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close '0)
)

(defun javascript-mode-init()
  "Set some buffer-local variables."
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)
  (setq tab-width 4)
  (smart-tab-mode nil)
)

(defun html-mode-init()
  "Set some buffer-local variables."
  (setq indent-tabs-mode nil)
  (setq sgml-basic-offset 4)
)

(defun c-mode-init()
  "Set some buffer-local variables."
  (setq indent-tabs-mode 1)
  (setq c-basic-offset 8)
)

(defun scss-mode-init()
  "Set some buffer-local variables"
  (setq scss-compile-at-save nil)
)

(add-hook 'php-mode-hook 'pear/php-mode-init)
(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
(add-hook 'html-mode-hook 'html-mode-init)
;; The Javascript mode is js-mode.
(add-hook 'js-mode-hook 'javascript-mode-init)
(add-hook 'c-mode-hook 'c-mode-init)
(add-hook 'scss-mode-hook 'scss-mode-init)
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))