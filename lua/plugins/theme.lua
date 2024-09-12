return {
	{
		'ntk148v/habamax.nvim',
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			vim.cmd.colorscheme 'habamax.nvim'
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = false,
				theme = 'habamax',
				component_separators = '|',
				section_separators = '',
			},
		},
	}
}
