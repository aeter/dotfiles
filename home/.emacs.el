;;;; =============== MELPA packages ======
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
	  (package-refresh-contents))

(defvar my-packages (quote (
    better-defaults
    jbeans-theme
    evil-collection
    evil)))

(mapc #'(lambda (package)
	  (unless (package-installed-p package) (package-install package)))
      my-packages)


;;;; =========== evil ==================
;; Enable Evil and evil-collection
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))
(evil-mode 1)
(evil-select-search-module 'evil-search-module 'evil-search) ;; vim search with /

(evil-set-initial-state 'help-mode 'emacs) ;; does this work? https://emacs.stackexchange.com/questions/31244/how-can-i-disable-evil-in-help-mode
(evil-set-initial-state 'eww 'emacs) ;; does this work? https://emacs.stackexchange.com/questions/31244/how-can-i-disable-evil-in-help-mode

; evil bindings for eww...like a normal browser
(evil-collection-define-key 'normal 'eww-mode-map
  (kbd "M-<left>") 'eww-back-url
  (kbd "M-<right>") 'eww-forward-url)

; so that we can click on hyperlinks with <RET>
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; search in readonly buffers
(when buffer-read-only
  (setq view-read-only t)     ; enter view-mode for read-only files
  (define-key view-mode-map "n" 'next-line)
  (define-key view-mode-map "N" 'previous-line))


;;;; =========== org mode ==============
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

(setq org-babel-python-command "python3")

(setq org-confirm-babel-evaluate nil  ;; disable question
          org-src-fontify-natively t
          org-src-tab-acts-natively t) ;; remove 'do you want to execute'

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images) ;; inline images for jupyter...


;;;; =========== theme =================
(require 'better-defaults)
(load-theme 'jbeans t)
(set-frame-font "DejaVu Sans Mono:pixelsize=24:foundry=PfEd:weight=normal:slant=normal:width=normal:spacing=100:scalable=true" nil t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(global-linum-mode t) ; line numbers
(setq-default show-trailing-whitespace t)
(setq ring-bell-function 'ignore) ;; disable bell and visual bell


;;;; =========== misc =================
(defalias 'source 'load-file)

;; change eww's User-Agent. Notice the newline at the end. Code from reddit.
(require 'url-http)
(defun url-http-user-agent-string ()
  "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:108.0) Gecko/20100101 Firefox/108.0
")

;;;; =========== misc auto ================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7b1ea77093c438aa5887b2649ca079c896cc8780afef946d3b6c53931081a726" default)))
 '(package-selected-packages (quote (better-defaults jbeans-theme org zeno-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
