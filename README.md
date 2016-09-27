# emacs_config
Personal settings for emacs. <br>
My somewhat small config file  <br>
Feel free to copy any of the commands found within

Font used: http://www.carrois.com/fira-4-1/#download <br>
 

![Image of Emacs](https://raw.githubusercontent.com/TyphoidTony/emacs_config/master/Emacs.png "image")

# My defined commands & Keybinds

  Currently now have to many personal aliases to list
  But to find out what they're called and to use them open the userdefalias.el file. 
  And also to find out custom functions I have check out the user-functions.el for the documentation and explanation of each function





# 'Modules' 

  Right now I have broken my emacs config down into 6 separate files each with their own defined use. I am still fine tuning this as building up your emacs config to make it readable and sustainable to use for the future takes a while. <br> 

I've looked into different ways of modularizing my config and this been the best way I could do it so far. The rucks of it is I have my main .emacs file which acts as main and requires all the files from the user-init directory, which is located in emacs.d and that's it. 




#List of used packages

- Aggressive-indent
- ac-cider
- auto-complete
- auto-pair
- cider
- clojure-mode
- ecb (as a replacement for sr-speedbar)
- fixmee
- gruvbox-theme
- ido
- iedit
- paredit
- powerline
- rainbow-identifiers
- rainbow-delimiters
- spaceline
- smex
- yasnippet
<br> 

Any other packages found in my emacs.d are not ones that I downloaded for myself but rather they were dependencies for other packages.


#TODO 
Simple todo list for my config file. 

- Break config into 'modules' to loaded by the main config file. (DONE but this is a constant effort)
- On 'fresh install' of emacs have emacs auto-install all the needed packages. 
- Get better auto-complete functionality for C-mode (done to some extent issues are that getting proper auto-complete working with non-clang compilers is annoying and seeing as how the only time I use C is for embedded programming I might have to live with no real IDE level auto-complete)
- Intergrate org-mode more into my workflow 
- More to come soon. 