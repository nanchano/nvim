return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"jsonls",
				"yamlls",
				"lua_ls",
				"pyright",
				"ruff",
				"gopls",
				"terraformls",
			},
		},
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
		opts = {
			ensure_installed = {
				"ruff",
				"jsonlint",
				"yamllint",
			},
		},
	},
}
