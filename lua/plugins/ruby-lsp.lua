return {
  -- ruby-lsp runs from a tooling-only Gemfile.local inside each Rails project,
  -- using that project's mise-selected Ruby. Not managed by Mason.
  "neovim/nvim-lspconfig",
  ft = { "ruby", "eruby" },
  config = function()
    vim.lsp.config("ruby_lsp", {
      cmd = function(dispatchers, config)
        -- Resolve the project root the server is starting in.
        local root = config and config.root_dir or vim.fn.getcwd()
        local gemfile = root .. "/Gemfile.local"

        -- If the project has a Gemfile.local, run ruby-lsp against it so it
        -- resolves the host-installed tooling gems. mise provides the project
        -- Ruby because we're executing inside the project root.
        local env = {
          BUNDLE_PATH = nil,
          BUNDLE_WITHOUT = nil,
          BUNDLE_WITH = nil,
        }
        if (vim.uv or vim.loop).fs_stat(gemfile) then
          env.BUNDLE_GEMFILE = gemfile
        end

        return vim.lsp.rpc.start(
          { "bundle", "exec", "ruby-lsp" },
          dispatchers,
          { cwd = root, env = env }
        )
      end,
      filetypes = { "ruby", "eruby" },
      root_markers = { "Gemfile", ".git", ".ruby-version", "mise.toml", ".mise.toml" },
      init_options = {
        formatter = "standard",   -- conform owns formatting via standardrb
        linters = { "standard" }, -- diagnostics via standard, matches formatter
        indexing = {
          excludedPatterns = {
            "**/vendor/bundle/**/*.rb", -- the app/container bundle copy
          },
        },
      },
    })

    vim.lsp.enable("ruby_lsp")
  end,
}
