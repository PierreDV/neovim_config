return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"bash", "css", "csv", "dockerfile", "go", "graphql", "html", "http", "javascript", "json", "lua", "python", "r", "regex", "ruby", "scss","sql", "typescript", "vim", "vimdoc", "vue", "yaml"},
      highlight = { enabled = true },
      indent = { enable = true },
    })
  end
}
