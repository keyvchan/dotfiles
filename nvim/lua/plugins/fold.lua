vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require("origami").setup({
	autoFold = {
		enabled = false,
	},
	foldKeymaps = {
		setup = false,
	},
})
