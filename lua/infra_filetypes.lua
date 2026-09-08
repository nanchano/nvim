local function html_template_or(fallback)
	return function(_, bufnr)
		local content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, 100, false), "\n")
		if content:find("<[%a][%w:-]*[%s>/]") or content:find("</[%a][%w:-]*%s*>") then
			return "gohtmltmpl"
		end
		return fallback
	end
end

vim.filetype.add({
	extension = {
		gohtml = "gohtmltmpl",
		gohtmltmpl = "gohtmltmpl",
		gotmpl = html_template_or("gotmpl"),
		tf = "terraform",
		tmpl = html_template_or("template"),
	},
	pattern = {
		[".*%.html%.tmpl"] = "gohtmltmpl",
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
