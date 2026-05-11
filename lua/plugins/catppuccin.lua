return {
  "catppuccin/nvim",
  priority = 1000,
  opts = {
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.subtext1 },
        CursorLineNr = { fg = colors.mauve, style = { "bold" } },
      }
    end
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
