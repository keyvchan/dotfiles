require("dressing").setup({
	select = {
		backend = "telescope",
		winblend = 0,
		telescope = require("telescope.themes").get_cursor(),
		builtin = {
			relative = "cursor",
		},
	},
	win_options = {
		winblend = 0,
		winhighlight = "NormalFloat:Normal",
	},
})
