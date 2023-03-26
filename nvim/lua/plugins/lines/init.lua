local M = {
	"rebelot/heirline.nvim",
	event = "UiEnter",
}

function M.config()
	-- always show tabline
	vim.o.showtabline = 2
	require("heirline").setup({
		statusline = require("plugins.lines.statusline").statusline,
		tabline = require("plugins.lines.tabline").BufferLine,
		-- winbar = {},
	})
end

return M
