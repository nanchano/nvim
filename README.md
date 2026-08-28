# Neovim configuration

Lua configuration for Neovim, based on
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

## Bootstrap

This configuration targets the stable Neovim 0.12.5 release on Linux x86-64.
The bootstrap installs the checksum-verified official Neovim archive under
`~/.local/share/nvim-bootstrap`, links it as `~/.local/bin/nvim`, synchronizes
the locked plugins, installs the configured Mason tools, and runs the smoke
suite:

```sh
scripts/bootstrap
```

Make sure `~/.local/bin` appears before `/usr/local/bin` in `PATH`. The script
will not replace an existing non-symlink at `~/.local/bin/nvim`.

The following base tools must already be supplied by the operating system:

- Git, curl, tar, gzip, unzip, and SHA-256 utilities
- A C/C++ build toolchain
- Node.js and npm
- `fd` (`fd-find` on Debian/Devuan)
- A clipboard provider such as `xclip`
- ripgrep

On Debian or Devuan, the bootstrap prints the appropriate `apt` command if a
required base tool is missing. It also links Debian's `fdfind` executable as
`~/.local/bin/fd`. The clipboard provider remains optional for headless startup
but is needed for system clipboard integration.

Mason owns the editor-specific tools, including language servers, Ruff,
`jsonlint`, `goimports`, `jq`, Terraform, Terraform LS, and Tree-sitter CLI.
The Tree-sitter CLI must be at least 0.26.1; the current Mason registry installs
0.26.13. It is deliberately not installed through npm, following
[nvim-treesitter's requirements](https://github.com/nvim-treesitter/nvim-treesitter#requirements).

The Neovim version and archive checksum in `scripts/bootstrap` are intentionally
pinned. Update both values together when moving to a newer stable release. See
the [official Neovim releases](https://github.com/neovim/neovim/releases).

## Debugging startup

Test the current plugin installation:

```sh
scripts/check-nvim
```

The suite verifies the exact Neovim version, plain startup, eager loading of all
plugins, and representative Lua, JSON, Markdown, Go, Go-template, Python, YAML,
and Terraform buffers. For supported filetypes it also verifies that Tree-sitter
highlighting actually starts. Error output is treated as failure even when
Neovim exits with status 0. Logs and a health report are saved under
`.nvim-debug/latest/`.

Reproduce a day-0 install without modifying the live Neovim data directory:

```sh
scripts/check-nvim --clean
```

Clean mode copies the config and lockfile into temporary XDG directories,
installs the locked plugins, Mason tools, and Tree-sitter parsers, runs the same
checks, and removes the temporary installation. Diagnostic logs remain under
`.nvim-debug/latest/`.
