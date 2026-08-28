return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	init = function()
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					validate = true,
					hover = true,
					completion = true,
					keyOrdering = false,
					format = {
						enable = false,
					},
					schemaStore = {
						enable = true,
					},
				},
			},
		})
	end,
	config = function()
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				-- buffer local mappings
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				-- show definition, references
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				-- go to declaration
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				-- show lsp definitions
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				-- show lsp implementations
				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				-- show lsp type definitions
				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				-- see available code actions
				opts.desc = "Show available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				-- smart rename
				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- show diagnostics
				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				-- show diagnostics for line
				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				-- jump to previous diagnostic in buffer
				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, opts)

				-- jump to next diagnostic in buffer
				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, opts)

				-- show documentation for what is under cursor
				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				-- mapping to restart lsp if necessary
				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
			end,
		})

		-- enable inlay hint
		vim.lsp.inlay_hint.enable(true)

		-- lua: recognize "vim" and "mp" global
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "mp" },
					},
				},
			},
		})

		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					buildFlags = { "-tags=integration" },
				},
			},
		})
	end,
}
