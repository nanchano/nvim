return {
	--	"CopilotC-Nvim/CopilotChat.nvim",
	--	branch = "main",
	--	dependencies = {
	--		{ "github/copilot.vim" },
	--		{ "nvim-lua/plenary.nvim" },
	--	},
	--	build = "make tiktoken",
	--	opts = {
	--		debug = true,
	--		model = 'gpt-4o',
	--		clear_chat_on_new_prompt = false,
	--	},
	--	config = function()
	--		require("CopilotChat").setup()

	--		vim.keymap.set("n", "<leader>cc", ":CopilotChatOpen<CR>", {})
	--		vim.keymap.set("v", "<leader>cf", ":CopilotChatFix<CR>", {})
	--		vim.keymap.set("v", "<leader>cd", ":CopilotChatDocs<CR>", {})
	--		vim.keymap.set("v", "<leader>ct", ":CopilotChatTests<CR>", {})
	--	end
}
