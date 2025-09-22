require("notify").setup({
	background_colour = "#000000",
	timeout = 5000,
	fps = 60,
	on_open = function(win)
		vim.api.nvim_win_set_config(win, { focusable = false })
	end,
})
vim.notify = require("notify")
