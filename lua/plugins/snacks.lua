return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    gitbrowse = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      ui_select = true,
    },
  },
  keys = {
    {
      "<leader>gb",
      function()
        require("snacks").gitbrowse()
      end,
    },
    {
      "<leader>ff",
      function()
        require("snacks").picker.files({ hidden = true })
      end,
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.grep()
      end,
    },
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers()
      end,
    },
  },
}
