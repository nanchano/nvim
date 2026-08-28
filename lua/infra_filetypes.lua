vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		tf = "terraform",
	},
})

local infra_yaml_group = vim.api.nvim_create_augroup("InfraYaml", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = infra_yaml_group,
	pattern = { "yaml", "helm", "gotmpl" },
	callback = function()
		vim.opt_local.textwidth = 0
		vim.opt_local.colorcolumn = ""
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})
