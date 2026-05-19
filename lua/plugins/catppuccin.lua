return {
  "catppuccin/nvim",
  priority = 1000,
  opts = {
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.subtext1, bg = colors.crust },
        CursorLineNr = { fg = colors.mauve, bg = colors.crust, style = { "bold" } },
        SignColumn = { bg = colors.crust },
      }
    end
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
