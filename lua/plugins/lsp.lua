return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"eslint",
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"ruby_lsp",
			"ts_ls",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		"neovim/nvim-lspconfig",
	},
}
