(put 'upcase-region 'disabled nil)

					;startup hook starts here ----

(add-hook 'emacs-startup-hook
	  (lambda ()  



	    (require 'darktooth-theme)
	    (set-face-attribute 'default nil :font "Consolas 12")
	    (require 'powerline)
	    (powerline-default-theme)
	    
	    
	    (when (>= emacs-major-version 24)
	      (require 'package)
	      (package-initialize)
	      (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
	      )


	    (require 'autopair) 
	    (autopair-global-mode)

	    (require 'neotree)
	    (neotree)
	    (require 'auto-complete)
	    (ac-config-default)  
	    (require 'auto-complete-config)
	    (auto-complete-mode)
	    
	    (require 'yasnippet)
	    (yas-global-mode 1)
	    
	    
	    (scroll-bar-mode -1)
	    (add-hook 'after-make-frame-functions
		      '(lambda (frame)
			 (modify-frame-parameters frame
						  '((vertical-scroll-bars . nil)
						    (horizontal-scroll-bars . nil)))))


	    (defun kcb()
	      (interactive)
	      (kill-buffer))

	    (defun lsp()
	      (interactive)
	      (list-packages))


	    (global-aggressive-indent-mode 1)
					; shows the parne mode, highlighting the parens of a pair. 
	    (show-paren-mode 1)
					; turns off system sound
	    (setq visible-bell t)
					; sets highlight linemode on
	    (global-hl-line-mode)

	    

	    (defun my-previous-window()
	      "Previous window"
	      (interactive)
	      (other-window -1))           
	    (global-set-key  (kbd "C-x C-,") 'my-previous-window) 
	    (global-set-key (kbd  "C-x C-.") 'other-window)

					; switches between previous and next buffer
	    (global-set-key (kbd "C-x C-l") 'next-buffer)
	    (global-set-key (kbd "C-x C-j") 'previous-buffer)

					; this makes it so that ctrl + arrows resize the current buffer window
	    (global-set-key (kbd "<C-up>") 'shrink-window)
	    (global-set-key (kbd "<C-down>") 'enlarge-window)
	    (global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
	    (global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)


	    (defun my-previous-window()
	      "Previous window"
	      (interactive)
	      (other-window -1))           
	    (global-set-key  (kbd "C-x C-,") 'my-previous-window) 
	    (global-set-key (kbd  "C-x C-.") 'other-window)

					; switches between previous and next buffer
	    (global-set-key (kbd "C-x C-l") 'next-buffer)
	    (global-set-key (kbd "C-x C-j") 'previous-buffer)


	    (require 'fic-mode)
	    (add-hook 'arduino-mode 'turn-on-fic-mode)
	    


					; disables linum-mode in specific buffers
	    (setq linum-mode-inhibit-modes-list '(eshell-mode
						  shell-mode
						  erc-mode
						  jabber-roster-mode
						  jabber-chat-mode
						  gnus-group-mode
						  gnus-summary-mode
						  gnus-article-mode))

	    (defadvice linum-on (around linum-on-inhibit-for-modes)
	      "Stop the load of linum-mode for some major modes."
	      (unless (member major-mode linum-mode-inhibit-modes-list)
		ad-do-it))

	    (ad-activate 'linum-on)
	    (global-linum-mode)


					;git interface for emacs
	    (require 'egg)



	    (kill-buffer "*GNU Emacs*");If you don't see "No buffer named GNU emacs in the minibuffer the entire init file did not load"
	    (cd "C:/users/null/workspace/")
	    
	    )); end of startup hook







(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (darktooth)))
 '(custom-safe-themes
   (quote
    ("272e45b301d3a8ffaad475191f9a406361e70b1fb60acb42354184cf290e04f5" default)))
 '(desktop-restore-frames t)
 '(desktop-restore-reuses-frames t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
