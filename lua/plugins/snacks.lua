return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    gitbrowse = { enabled = true },
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
      desc = "Open file in browser",
    },
    {
      "<leader>ff",
      function()
        require("snacks").picker.files({ hidden = true })
      end,
      desc = "Find Files"
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Live Grep"
    },
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Find Buffers"
    },
  },
}
