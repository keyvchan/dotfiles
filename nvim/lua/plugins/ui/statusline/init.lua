local M = {
	"rebelot/heirline.nvim",
	event = "UIEnter",
	dependencies = {
		{
			"linrongbin16/lsp-progress.nvim",
			config = function()
				require("lsp-progress").setup({})
			end,
		},
	},
}

function M.config()
	require("heirline").setup({
		statusline = require("plugins.ui.statusline.main").statusline,
	})
end

return M
