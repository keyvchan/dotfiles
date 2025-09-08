local M = {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	opts = {
		autoFold = {
			enabled = false,
		},
		foldKeymaps = {
			setup = false,
		},
	},

	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}

return M
