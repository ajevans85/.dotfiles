(use-package darcula-theme
  :ensure t
  :init
  (load-theme ' darcula t))

(use-package powerline
  :ensure t
  :init
  (setq powerline-evil-tag-style 'verbose))

(use-package powerline-evil
  :ensure t)


(set-face-attribute 'default nil :font "Source Code Pro-14")

(column-number-mode 1) ;;Display coloumn numbers in the status bar

(show-paren-mode 1) ; turn on paren match highlighting


(global-hl-line-mode 1) ;Enable current line highlighting
(set-face-background 'hl-line "#424445")

(custom-set-faces
 '(powerline-evil-normal-face ((t (:foreground "green" :background "white" :weight ultra-bold ))))
 '(powerline-evil-insert-face ((t (:foreground "blue" :background "white"  :weight ultra-bold ))))
 '(powerline-evil-visual-face ((t (:foreground "orange" :background "white" :weight ultra-bold))))
 '(powerline-evil-operator-face ((t (:cyan "green" :background "white"  :weight ultra-bold ))))
 '(powerline-evil-replace-face ((t (:foreground "red" :background "white" :weight ultra-bold ))))
 '(powerline-evil-motion-face ((t (:foreground "magenta" :background "white" :weight ultra-bold ))))
 '(powerline-evil-emacs-face ((t (:foreground "violet" :background "white" :weight ultra-bold ))))
 '(powerline-evil-normal-face ((t (:foreground "green" :background "white"  :weight ultra-bold )))))

(setq powerline-evil-tag-style 'verbose)

(defun powerline-adam ()
  "Powerline's Vim-like mode-line with evil state at the beginning in color."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (evil-face (powerline-evil-face))

                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))

                          (lhs (append (if (and evil-mode active)  (list(powerline-raw " " evil-face)
                                                                        (powerline-raw (powerline-evil-tag) evil-face)
                                                                        (powerline-raw " " evil-face)
                                                                        (funcall separator-left evil-face face1))
                                                                   (list))

                                        (list (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                              (powerline-raw "[" mode-line 'l)
                                              (powerline-major-mode mode-line)
                                              (powerline-process mode-line)
                                             (powerline-raw "]" mode-line)
                                              (when (buffer-modified-p)
                                                (powerline-raw "[+]" mode-line))
                                              (when buffer-read-only
                                                (powerline-raw "[RO]" mode-line))
                                              (powerline-raw "[%z]" mode-line)
                                              ;; (powerline-raw (concat "[" (mode-line-eol-desc) "]") mode-line)
                                              (when (and (boundp 'which-func-mode) which-func-mode)
                                                (powerline-raw which-func-format nil 'l))
                                              (when (boundp 'erc-modified-channels-object)
                                                (powerline-raw erc-modified-channels-object face1 'l))
                                              (powerline-raw "[" mode-line 'l)
                                              (powerline-minor-modes mode-line)
                                              (powerline-raw "%n" mode-line)
                                              (powerline-raw "]" mode-line)
                                              (when (and vc-mode buffer-file-name)
                                                (let ((backend (vc-backend buffer-file-name)))
                                                  (when backend
                                                    (concat (powerline-raw "[" mode-line 'l)
                                                            (powerline-raw (format "%s/%s" backend (vc-working-revision buffer-file-name backend)))
                                                            (powerline-raw "]" mode-line))))))))

                          (rhs (list (powerline-raw '(10 "%i"))
                                     (powerline-raw global-mode-string mode-line 'r)
                                     (powerline-raw "%l," mode-line 'l)
                                     (powerline-raw (format-mode-line '(10 "%c")))
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))

                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))


(powerline-adam)



