					;#####################; 
					;##### Packages ######; 
					;#####################;


(require 'gruvbox-theme)


(require 'powerline)
(powerline-default-theme)



(require 'autopair) 
(autopair-global-mode)


(require 'rfringe)


(require 'auto-complete)
(auto-complete-mode)
(ac-config-default)  


(global-set-key (kbd  "C-x C-;") 'iedit-mode)

(require 'yasnippet)
(yas-global-mode 1)

(global-aggressive-indent-mode 1)

;;for all those nice variable colors
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;;sr-speedbar code block
(require 'sr-speedbar)
(sr-speedbar-open)
(with-current-buffer sr-speedbar-buffer-name
  (setq window-size-fixed 'width))
(custom-set-variables
 '(speedbar-show-unknown-files 1)
 '(sr-speedbar-refresh-turn-on)
 )

(projectile-global-mode)
(unless (setq projectile-indexing-method 'native)
  (setq projectile-indexing-method 'alien))
(setq projectile-enable-caching t)

(require 'smex )
(global-set-key (kbd "M-x") 'smex)

(require 'fixmee)
(fixmee-mode t)
