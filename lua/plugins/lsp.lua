local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
end

return {
	{
		'williamboman/mason.nvim',
		dependencies = {
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		lazy = false,
		config = function()
			require('mason').setup()
			local mason_tool_installer = require 'mason-tool-installer'
			mason_tool_installer.setup {
				ensure_installed = {
					'gopls',
					'jsonlint',
					'lua-language-server',
					'ruff',
				},
			}
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			local cmp = require 'cmp'
			local lspconfig = require 'lspconfig'
			local cmp_lsp = require 'cmp_nvim_lsp'
			local mason_lspconfig = require 'mason-lspconfig'
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities())

			mason_lspconfig.setup_handlers {
				function(server_name)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}
				end,
			}

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim', 'require' },
						},
					},
				},
			})

			lspconfig.ruff.setup({
				cmd = { vim.fn.expand("$HOME") .. "/.local/bin/ruff", "server" },
				filetypes = { 'python' },
				root_dir = function(fname)
					local root = lspconfig.util.root_pattern('pyproject.toml', 'ruff.toml', '.ruff.toml')(fname)
					if root then
						return root
					end
					local git_dir = vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
					if git_dir then
						return git_dir
					end
					-- If no project root is found, return the directory of the current file as a last resort
					return vim.fs.dirname(fname)
				end,
				single_file_support = true,
				settings = {}
			})

			cmp.setup {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert {
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<C-y>'] = cmp.mapping.confirm { select = true },
					['<C-Space>'] = cmp.mapping.complete(),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				}),
			}

			vim.diagnostic.config {
				-- update_in_insert = true,
				float = {
					focusable = false,
					style = 'minimal',
					border = 'rounded',
					source = 'always',
					header = '',
					prefix = '',
				},
			}

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
		end,
	},
}
