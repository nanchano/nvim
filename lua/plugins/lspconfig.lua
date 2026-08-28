return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	init = function()
		local tooling = require("tooling")

		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		for server, config in pairs(tooling.servers) do
			vim.lsp.config(server, config)
		end
	end,
	config = function()
		local keymap = vim.keymap
		local tooling = require("tooling")

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client then
					-- Keep syntax colors controlled by Tree-sitter. Neovim otherwise
					-- starts semantic-token highlighting after this callback runs.
					client.server_capabilities.semanticTokensProvider = nil
				end

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

		vim.lsp.enable(vim.tbl_keys(tooling.servers))
	end,
}
