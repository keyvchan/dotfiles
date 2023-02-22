local M = {
	"rcarriga/nvim-notify",
	lazy = false,
}

function M.config()
	require("notify").setup({
		background_colour = "#000000",
	})
	vim.notify = require("notify")
end

return M
