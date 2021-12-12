## Neovim Configuration


### Pre-requisites
1. Python 3 and pip installed
      * Save path in paths.vim
      * pip install pynvim
      * pip install mypy flake8 black - for linting/fixing
2. Node.js and npm installed
      * Save path in paths.vim
      * npm install -g neovim
3. xsel installed
4. Vim-Plug installed - Plugin Manager
5. Run :CocConfig to create coc-settings.json
6. FZF, ripgrep, ctags-git, silversearcher-ac, fd-find installed
      * all of them by pacman except ctags-git (AUR)
7. Ranger installed
      * Also clone devicons: git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
      * Ueberzug installed - AUR ideally, otherwise pip
      * Ranger config saved on .config/ranger/rc.conf


### rc.conf
set preview_images_method ueberzug

default_linemode devicons

set show_hidden true


### Comments
Ranger is not compatible with NERDTree. Uninstall the latter or 'let g:NERDTreeHijackNetrw = 0' on rnvimr.vim

### Sources
1. [Chris at Machine blog](https://www.chrisatmachine.com/)
2. [Vim-Plug](https://github.com/junegunn/vim-plug)
3. [Themes](https://github.com/vim-airline/vim-airline/)
4. [CoC](https://github.com/neoclide/coc.nvim')
5. [Airline](https://github.com/vim-airline/vim-airline)
6. [Airline Themes](https://github.com/vim-airline/vim-airline-themes)
7. [Ranger](https://github.com/ranger/ranger)
8. [FZF](https://github.com/junegunn/fzf)
9. [ripgrep](https://github.com/BurntSushi/ripgrep)
10. [ctags](https://github.com/universal-ctags/ctags)
11. [Silversearcher](https://github.com/ggreer/the_silver_searcher)
12. [fd](https://github.com/sharkdp/fd)
13. [Vim-Commentary](https://github.com/tpope/vim-commentary)
14. [Signify](https://github.com/mhinz/vim-signify)
15. [Fugitive](https://github.com/tpope/vim-fugitive)
16. [Rhubarb](https://github.com/tpope/vim-rhubarb)
17. [GV](https://github.com/junegunn/gv.vim)
18. [Sneak](https://github.com/justinmk/vim-sneak)
