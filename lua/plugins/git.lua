return {
	{
		"tpope/vim-fugitive"
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
			vim.keymap.set("n", "gn", function()
				require("gitsigns").nav_hunk("next")
			end, { desc = "Next git hunk" })

			vim.keymap.set("n", "gv", function()
				require("gitsigns").nav_hunk("prev")
			end, { desc = "Previous git hunk" })
		end
	}
}
