return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    gitbrowse = {}
  },
  keys = {
    { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
  }
}
