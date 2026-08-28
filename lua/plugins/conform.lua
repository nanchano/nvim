return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		local tooling = require("tooling")

		conform.setup({
			formatters_by_ft = tooling.formatters_by_ft,
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})

		conform.formatters.jq = {
			args = { "--indent", "2" },
		}
	end,
}
