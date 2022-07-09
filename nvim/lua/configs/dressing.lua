require("dressing").setup({
	select = {
		backend = "telescope",
		winblend = 0,
		telescope = require("telescope.themes").get_cursor(),
		builtin = {
			relative = "cursor",
		},
	},
	input = {
		winblend = 0,
		winhighlight = "NormalFloat:Normal",
	},
})
