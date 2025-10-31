return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { "thesimonho/kanagawa-paper.nvim" },
		config = function()
			vim.cmd.colorscheme("kanagawa-paper-ink")
			local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = kanagawa_paper,
					component_separators = '|',
					section_separators = '',
				},
			})
		end,
	}
}
