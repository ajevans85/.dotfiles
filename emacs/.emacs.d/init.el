;; Turn these off early to stop display on startup
(menu-bar-mode -1) ; Disable the menu bar
(tool-bar-mode -1) ;Disable the menu bar
(scroll-bar-mode -1) ;Disable the scroll bar

(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-locale-environment "en_GB")
(setq tls-checktrust t)

(add-to-list 'load-path "~/.emacs.d/conf.d")
(add-to-list 'load-path "~/.emacs.d/packages/use-package")

(require 'package)
(setq
  package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                    ("melpa" . "https://melpa.org/packages/")
                    ("melpa-stable" . "https://stable.melpa.org/packages/"))
  package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Install packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package exec-path-from-shell
  :if(memq window-system '(mac ns))
  :ensure t
  :init
   (exec-path-from-shell-initialize))

;; VIM Keybindings
(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  (evil-set-initial-state 'nav-mode 'emacs)
  (evil-set-initial-state 'diff-mode 'emacs)
  (evil-set-initial-state 'help-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'eww 'emacs)
  (evil-set-initial-state 'error 'emacs)
  (evil-set-initial-state 'ensime-inspector-mode 'emacs)
  (evil-set-initial-state 'sbt-mode 'emacs)
  (evil-set-initial-state 'ensime-search-mode 'emacs)
  (evil-set-initial-state 'fundamental-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'insert)
  (evil-set-initial-state 'shell-mode 'insert))

;; Relative line numbers for vim navigation. Set the current line symbol to a empty string
;; to show the current line number.
(use-package linum-relative
  :ensure t
  :init
  (setq linum-relative-current-symbol "")
  (add-hook 'prog-mode-hook 'linum-relative-mode))

;;Git support
(use-package magit
  :ensure t
  :init
  (setq magit-auto-revert-mode nil)
  (setq magit-last-seen-setup-instructions "1.4.0")
  (add-hook 'comment-mode-hook 'flyspell-prog-mode))

(use-package ivy
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-s" . swiper)
         ("C-x b" . ivy-switch-buffer))
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "
        ivy-height 10))

(use-package counsel-projectile
  :init
  (counsel-projectile-on)
  :ensure t)


(use-package flyspell-popup
  :ensure t
  :bind (:map flyspell-mode-map
         ("C-;" . flyspell-popup-correct))
  :config
  (add-hook 'flyspell-mode-hook 'flyspell-popup-auto-correct-mode))

;; Projectile support, treat git/svn/... repos as projects allowing easy navigation
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode 1))

;; Display key sugestions if use `M-x` and wait one second
(use-package which-key
  :ensure t
  :diminish which-key
  :config
  (which-key-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode))

;; Efficient line commenting, eg to comment to 2 lines: 2,,cl
(use-package evil-nerd-commenter
  :ensure t
  :init
  (evilnc-default-hotkeys))

(use-package markdown-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-hook 'markdown-mode-hook
            (lambda ()
              (writegood-mode t)
              (flyspell-mode t))))


;; Enable (), [], {} closing braces are closed as soon as typed
(use-package autopair
  :ensure t
  :init
  (autopair-global-mode))

;; Quick navigation using C-c SPC
(use-package avy
  :ensure t
  :init
  (global-set-key (kbd "C-c SPC") 'avy-goto-char))

;; Frame move + windmove-default-keybindings...navigate buffers+frames with shft+arrows
(use-package framemove
  :ensure t
  :init
  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))
    (setq framemove-hook-into-windmove t))

;; Automaticaly trim white space from end of lines unobtrusivley
(use-package ws-butler
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode))

;; zygospore lets you revert C-x 1 (delete-other-window) by pressing C-x 1 again. Useful for toggling zoom in buffer
(use-package zygospore
  :ensure t
  :init
  (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))

(use-package restclient
  :ensure t)

(use-package mode-icons
  :ensure t
  :config
  (mode-icons-mode t))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

;; Install scala support
(use-package ensime
 :ensure t
 :pin melpa
 :init
 (setq ensime-completion-style 'company)
 (setq ensime-startup-notification nil)
 (setq ensime-startup-snapshot-notification nil)
 (setq ensime-startup-snapshot-notification-3 nil)
 (setq ensime-search-interface 'ivy))

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa)

(load "style.el")
(load "general-settings.el")
(load "custom-functions.el")

