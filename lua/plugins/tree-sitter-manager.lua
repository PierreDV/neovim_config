return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {},
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = { "regex" },
      auto_install = true,
    })
  end
}
