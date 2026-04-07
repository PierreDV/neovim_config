return {
	"juacker/git-link.nvim",
	keys = {
		{
			"<leader>go",
			function()
				require("git-link.main").open_line_url()
			end,
			desc = "Open code link in browser",
			mode = { "n", "x" },
		},
	},
}
