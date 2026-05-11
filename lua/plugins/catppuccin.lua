return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- Set the flavor here instead!
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.subtext1 },
        CursorLineNr = { fg = colors.mauve, style = { "bold" } },
      }
    end
  },
  config = function(_, opts)
    -- 1. Load the plugin with our custom opts
    require("catppuccin").setup(opts)

    -- 2. Then tell Neovim to actually use it
    vim.cmd.colorscheme("catppuccin")
  end,
}
