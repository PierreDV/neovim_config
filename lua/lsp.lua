local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }
    -- set keybinds
    opts.desc = "Show LSP references"
    keymap.set("n", "gR", function() require("snacks").picker.lsp_references() end, opts)

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", function() require("snacks").picker.lsp_implementations() end, opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", function() require("snacks").picker.lsp_type_definitions() end, opts)

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", function() require("snacks").picker.diagnostics_buffer() end, opts)

    opts.desc = "Show project diagnostics"
    keymap.set("n", "<leader>fd", function() require("snacks").picker.diagnostics() end, opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
  end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = "󰈸",
      [severity.WARN] = "",
      [severity.HINT] = "󰌶",
      [severity.INFO] = "",
    },
  },
})
