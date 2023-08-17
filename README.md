## Neovim Configuration
Minimal neovim configuration written in Lua.

Based on the [kickstart](https://github.com/nvim-lua/kickstart.nvim) config

Packages are managed by [lazy.vim](https://github.com/folke/lazy.nvim), which will be automatically installed on the first startup of neovim, along with all the plugins and language servers.

If you have a curernt installation, or experience any issues, try deleting the local cache and starting again: `rm -rf $HOME/.local/share/nvim`

### Pre-requisites
1. neovim 0.9+
2. Python 3 and pip installed
      * pip install pynvim
3. NodeJS and npm installed
      * node i -g neovim
4. xsel, xclip or other clipboard manager installed
5. ripgrep and fzf for treesitter.
