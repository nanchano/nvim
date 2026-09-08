local parsers = {
	"bash",
	"css",
	"go",
	"gotmpl",
	"helm",
	"html",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"terraform",
	"yaml",
}

local filetypes = {
	"bash",
	"css",
	"go",
	"gohtmltmpl",
	"gotmpl",
	"helm",
	"html",
	"json",
	"lua",
	"markdown",
	"python",
	"sh",
	"terraform",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			vim.treesitter.language.register("html", "gohtmltmpl")
			treesitter.setup()
			local bootstrap = vim.env.NVIM_INSTALL_PARSERS == "1"
			local interactive = #vim.api.nvim_list_uis() > 0
			if vim.fn.executable("tree-sitter") == 1 and (bootstrap or interactive) then
				local install = treesitter.install(parsers)
				if bootstrap then
					install:wait(300000)
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(event)
					vim.treesitter.start(event.buf)
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
				move = { set_jumps = true },
			})

			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")
			local swap = require("nvim-treesitter-textobjects.swap")

			local selections = {
				aa = "@parameter.outer",
				ia = "@parameter.inner",
				af = "@function.outer",
				["if"] = "@function.inner",
				ac = "@class.outer",
				ic = "@class.inner",
			}
			for lhs, query in pairs(selections) do
				vim.keymap.set({ "x", "o" }, lhs, function()
					select.select_textobject(query, "textobjects")
				end)
			end

			local movements = {
				["]m"] = { move.goto_next_start, "@function.outer" },
				["]]" ] = { move.goto_next_start, "@class.outer" },
				["]M"] = { move.goto_next_end, "@function.outer" },
				["]["] = { move.goto_next_end, "@class.outer" },
				["[m"] = { move.goto_previous_start, "@function.outer" },
				["[["] = { move.goto_previous_start, "@class.outer" },
				["[M"] = { move.goto_previous_end, "@function.outer" },
				["[]"] = { move.goto_previous_end, "@class.outer" },
			}
			for lhs, movement in pairs(movements) do
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					movement[1](movement[2], "textobjects")
				end)
			end

			vim.keymap.set("n", "<leader>a", function()
				swap.swap_next("@parameter.inner")
			end)
			vim.keymap.set("n", "<leader>A", function()
				swap.swap_previous("@parameter.inner")
			end)
		end,
	},
}
