(put 'upcase-region 'disabled nil)


					;###################################; 
					;########### startup hook ##########;
					;###################################;
(add-hook 'emacs-startup-hook
	  (lambda ()  




	    ;;99% of my config are in these files
	    (load "~/.emacs.d/user-init/user-functions")
	    (load "~/.emacs.d/user-init/user-init")
	    (load "~/.emacs.d/user-init/user-ido")
	    (load "~/.emacs.d/user-init/user-CEDET")
	    (load "~/.emacs.d/user-init/user-defalias")
	    (load "~/.emacs.d/user-init/user-packages")
	    (print "If you see this emacs has loaded properly")
	    )); end of startup hook 



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(desktop-restore-frames t)
 '(desktop-restore-reuses-frames t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(ecb-tip-of-the-day nil)
 '(initial-scratch-message ";;")
 '(menu-bar-mode nil)
 '(org-agenda-files nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/"))))
 '(pop-up-windows nil)
 '(rainbow-identifiers-face-count 8)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images nil)
 '(sr-speedbar-default-width 40)
 '(sr-speedbar-refresh-turn-on nil)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil)
 '(yahoo-weather-location "Ravena, NY")
 '(yahoo-weather-use-F t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
