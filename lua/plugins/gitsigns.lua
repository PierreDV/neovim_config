return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- Inline Blame Configuration
		current_line_blame = true,
		signcolumn = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			vim.keymap.set("n", "<leader>gb", function()
				local blame_info = gs.get_blame_info()
				if blame_info and blame_info.sha then
					local url = "https://github.com/USER/REPO/commit/" .. blame_info.sha
					-- Note: Replacing USER/REPO dynamically is the tricky bit!
					vim.fn.jobstart({ "open", url }) -- 'open' for macOS, 'xdg-open' for Linux
				end
			end, { buffer = bufnr, desc = "Open commit in Browser" })
		end,
	},
}
