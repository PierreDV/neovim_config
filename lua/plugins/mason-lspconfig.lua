return {
  "mason-org/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "eslint", "lua_ls", "solargraph", "stylelint_lsp", "rubocop" },
    }
  end
}
