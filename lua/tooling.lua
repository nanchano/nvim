return {
	-- Mason package names. Run :MasonToolsInstall after changing this list.
	ensure_installed = {
		"gopls",
		"goimports",
		"json-lsp",
		"jq",
		"lua-language-server",
		"pyright",
		"ruff",
		"terraform",
		"terraform-ls",
		"tree-sitter-cli",
		"typescript-language-server",
		"yaml-language-server",
	},

	-- Conform uses these first, then falls back to an attached LSP formatter.
	formatters_by_ft = {
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		go = { "gofmt", "goimports" },
		json = { "jq" },
		terraform = { "terraform_fmt" },
	},

	-- Native LSP server names and their configuration. Servers listed here are
	-- the only ones enabled by this config.
	servers = {
		gopls = {
			settings = {
				gopls = {
					buildFlags = { "-tags=integration" },
				},
			},
		},
		jsonls = {},
		lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "mp" },
					},
				},
			},
		},
		pyright = {
			settings = {
				python = {
					analysis = {
						disableOrganizeImports = true,
					},
				},
			},
		},
		ruff = {},
		terraformls = {},
		ts_ls = {},
		yamlls = {
			settings = {
				yaml = {
					validate = true,
					hover = true,
					completion = true,
					keyOrdering = false,
					format = { enable = false },
					schemaStore = { enable = true },
				},
			},
		},
	},
}
