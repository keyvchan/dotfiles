local M = {
	"rebelot/heirline.nvim",
	event = "UIEnter",
	dependencies = {
		{
			"linrongbin16/lsp-progress.nvim",
			opts = {},
		},
	},
}

function M.config()
	require("heirline").setup({
		statusline = require("plugins.ui.statusline.main").statusline,
	})
end

return M
