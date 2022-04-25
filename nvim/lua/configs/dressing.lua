require("dressing").setup({
	select = {
		backend = "telescope",
		telescope = require("telescope.themes").get_cursor(),
		builtin = {
			relative = "cursor",
		},
	},
})
