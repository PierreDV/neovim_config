local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lsp")
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = {
    enabled = true,
    notify = false, -- Silent checking
  },
})

-- Auto-update plugins on startup (after a short delay)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Wait 100ms after startup to not slow down initial load
    vim.defer_fn(function()
      require("lazy").update({ show = false, wait = false })
    end, 100)
  end,
})
