return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			local files = require("mini.files")
			local bufremove = require("mini.bufremove")

			files.setup({
				options = {
					permanent_delete = false,
					use_as_default_explorer = true,
				},
				windows = {
					preview = true,
					width_focus = 40,
					width_nofocus = 20,
					width_preview = 40,
				},
			})
			bufremove.setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()

			local function toggle(path)
				if not files.close() then
					files.open(path, false)
				end
			end

			vim.keymap.set("n", "<leader>f", function()
				local path = vim.api.nvim_buf_get_name(0)
				toggle(path ~= "" and path or nil)
			end, { desc = "Toggle files at current file" })

			vim.keymap.set("n", "<leader>F", function()
				toggle(vim.fn.getcwd())
			end, { desc = "Toggle files at working directory" })

			vim.keymap.set("n", "<leader>bd", function()
				bufremove.delete(0, false)
			end, { desc = "Delete buffer" })

			vim.keymap.set("n", "<leader>bD", function()
				bufremove.delete(0, true)
			end, { desc = "Force delete buffer" })
		end,
	},
}
