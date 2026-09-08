return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-mini/mini.nvim",
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("MarkdownViewOptions", { clear = true }),
				pattern = "markdown",
				callback = function()
					vim.opt_local.wrap = true
					vim.opt_local.linebreak = true
					vim.opt_local.breakindent = true
				end,
			})
		end,
		opts = {
			enabled = true,
			render_modes = { "n", "c" },
			pipe_table = {
				-- Long tables are rendered by markdown-table-wrap.nvim.
				enabled = false,
			},
		},
	},
	{
		"ice345/markdown-table-wrap.nvim",
		ft = { "markdown" },
		opts = {
			auto_preview = true,
			preview_mode = "inline",
			inline_mode = "replace",
			inline_wrap_scope = "cursor",
			min_col_width = 6,
			max_col_width = 40,
			max_width_ratio = 0.95,
		},
	},
}
