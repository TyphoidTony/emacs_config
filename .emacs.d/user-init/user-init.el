
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(scroll-bar-mode -1)
(add-hook 'after-make-frame-functions
	  '(lambda (frame)
	     (modify-frame-parameters frame
				      '((vertical-scroll-bars . nil)
					(horizontal-scroll-bars . nil)))))

;;start linum mode 
(setq linum-mode-inhibit-modes-list '(eshell-mode
				      shell-mode
				      erc-mode
				      jabber-roster-mode
				      jabber-chat-mode
				      gnus-group-mode
				      gnus-summary-mode
				      gnus-article-mode
				      speedbar-mode
				      compilation-mode
				      text-mode
				      org-mode)) 

(defadvice linum-on (around linum-on-inhibit-for-modes)
  "STOP the load of linum-mode for some major modes."
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))

(ad-activate 'linum-on)
(global-linum-mode);;end linum mode 

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))

(defadvice pop-to-buffer (before cancel-other-window first)
  (ad-set-arg 1 nil))
(ad-activate 'pop-to-buffer)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)





(global-hl-line-mode)


(fset 'yes-or-no-p 'y-or-n-p)



(setq visible-bell nil)


(set-face-attribute 'default nil :font "Fira Mono 12")


(show-paren-mode t)


(setq backup-directory-alist '((".*" . "~/.emacs.d/emacs-backup")))
(setq auto-save-file-name-transforms '((".*""~/.emacs.d/emacs_auto-save")))


(set-frame-parameter (selected-frame) 'alpha '(89 89))

(global-set-key (kbd "C-=") 'hs-toggle-hiding)
(add-hook 'hs-minor-mode  'c-mode)

(windmove-default-keybindings)
