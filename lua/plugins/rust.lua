return {
  "neovim/nvim-lspconfig",
  ft = { "rust" },
  config = function()
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          check = { command = "clippy" },
          inlayHints = {
            bindingModeHints = { enable = true },
            chainingHints = { enable = true },
            closingBraceHints = { enable = true, minLines = 25 },
            closureCaptureHints = { enable = true },
            closureReturnTypeHints = { enable = true },
            discriminantHints = { enable = true },
            expressionAdjustmentHints = { enable = "always" },
            implicitDrops = { enable = true },
            lifetimeElisionHints = { enable = "always" },
            parameterHints = { enable = true },
            reborrowHints = { enable = "always" },
            typeHints = { enable = true },
          },
        },
      },
    })
    vim.lsp.enable("rust_analyzer")
  end,
}
