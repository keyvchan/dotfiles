require("FTerm").setup({
	border = "double",
	dimensions = {
		height = 0.3,
		width = 1,
		x = 0,
		y = 0.7,
	},
})

vim.keymap.set("n", "<leader>t", require("FTerm").toggle)
