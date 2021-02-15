## Neovim Configuration


### Pre-requisites
1. Python 3 and pip installed
      a. Save path in paths.vim
      b. pip install pynvim
2. Node.js and npm installed
      a. Save path in paths.vim
      b. npm install -g neovim
3. xsel installed (for copy and paste)
4. Vim-Plug installed - Plugin Manager
5. Run :CocConfig to create coc-settings.json
6. FZF, ripgrep, ctags-git, silversearcher-ac, fd-find installed
      a. all of them by pacman except ctags-git (AUR) 
7. Ranger installed
      a. Also clone devicons: git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
      b. Ueberzug installed - AUR ideally, otherwise pip
      c. Ranger config saved on .config/ranger/rc.conf


### rc.conf
set preview_images_method ueberzug

default_linemode devicons

set show_hidden true


### Comments
Ranger is not compatible with NERDTree. Uninstall the latter or 'let g:NERDTreeHijackNetrw = 0' on rnvimr.vim
