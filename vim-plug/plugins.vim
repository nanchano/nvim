" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Theme
    Plug 'cocopon/iceberg.vim'
    Plug 'arzg/vim-substrata'
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Faster comments
    Plug 'tpope/vim-commentary'
    " Git integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    " Quick searchs
    Plug 'justinmk/vim-sneak'
    " Go syntax/helper
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Rust syntax/helper
    Plug 'rust-lang/rust.vim'
    " Scala syntax/helper
    Plug 'derekwyatt/vim-scala'
    " For linting/fixing
    Plug 'dense-analysis/ale'
    " Python folding
    Plug 'tmhedberg/SimpylFold'
    " Autocomplete
    Plug 'maxboisvert/vim-simple-complete'
call plug#end()
