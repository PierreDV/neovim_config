return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "ruby_lsp", "ts_ls", "lua_ls" },
		})
	end,
}
