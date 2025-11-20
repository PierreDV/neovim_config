return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", {})
		require("neo-tree").setup({
			log_level = "info",
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.cmd([[setlocal relativenumber]])
					end,
				},
			},
		})
	end,
}
