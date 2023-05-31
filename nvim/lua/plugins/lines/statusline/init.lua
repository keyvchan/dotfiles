local M = {
	"rebelot/heirline.nvim",
	event = "UIEnter",
}

function M.config()
	require("heirline").setup({
		statusline = require("plugins.lines.statusline.main").statusline,
	})
end

return M
