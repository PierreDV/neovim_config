return {
  "nvimtools/none-ls.nvim",
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.hadolint,
      },
      on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
