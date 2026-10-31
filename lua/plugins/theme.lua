return {
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({})
			vim.cmd.colorscheme("vague")
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { "vague-theme/vague.nvim" },
		config = function()
			-- vague.nvim does not supply a lualine theme. Make one from its palette.
			local c = require("vague").get_palette()
			local function mode(color)
				return {
					a = { fg = c.bg, bg = color, gui = "bold" },
					b = { fg = c.fg, bg = c.line },
					c = { fg = c.comment, bg = c.inactiveBg },
				}
			end
			local vague = {
				normal = mode(c.keyword),
				insert = mode(c.plus),
				visual = mode(c.parameter),
				replace = mode(c.error),
				command = mode(c.string),
				terminal = mode(c.builtin),
				inactive = {
					a = { fg = c.comment, bg = c.inactiveBg },
					b = { fg = c.comment, bg = c.inactiveBg },
					c = { fg = c.comment, bg = c.inactiveBg },
				},
			}
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = vague,
					component_separators = '|',
					section_separators = '',
				},
			})
		end,
	}
}
