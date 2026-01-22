return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"eslint",
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"ts_ls",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ruby_lsp = {
					cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp" },
				},
			},
		},
	},
}
