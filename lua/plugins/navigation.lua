return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			enable = true,
			max_lines = 3,
			trim_scope = "outer",
			mode = "cursor",
		},
	},
	{
		"stevearc/aerial.nvim",
		branch = "nvim-0.11",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			backends = { "treesitter", "lsp", "markdown", "man" },
			filter_kind = false,
			layout = {
				default_direction = "prefer_right",
				max_width = { 40, 0.2 },
				min_width = 28,
			},
			show_guides = true,
		},
		keys = {
			{ "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle outline" },
		},
	},
}
