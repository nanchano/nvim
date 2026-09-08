local function html_language_id(_, filetype)
	return filetype == "gohtmltmpl" and "html" or filetype
end

return {
	-- Mason package names. Run :MasonToolsInstall after changing this list.
	ensure_installed = {
		"css-lsp",
		"gopls",
		"goimports",
		"html-lsp",
		"json-lsp",
		"jq",
		"lua-language-server",
		"pyright",
		"ruff",
		"superhtml",
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
		cssls = {},
		gopls = {
			settings = {
				gopls = {
					buildFlags = { "-tags=integration" },
				},
			},
		},
		html = {
			filetypes = { "html", "gohtmltmpl" },
			get_language_id = html_language_id,
			settings = {
				html = {
					format = {
						-- Preserve {{ ... }} blocks while formatting Go HTML templates.
						templating = true,
					},
					validate = {
						scripts = true,
						styles = true,
					},
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
		superhtml = {
			-- Full HTML-spec validation does not understand template expressions.
			-- Syntax-only still reports malformed nesting without flagging {{ ... }}.
			cmd = { "superhtml", "lsp", "--syntax-only" },
			filetypes = { "html", "gohtmltmpl" },
			get_language_id = html_language_id,
		},
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
