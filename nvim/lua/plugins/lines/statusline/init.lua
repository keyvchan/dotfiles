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
		statusline = require("plugins.lines.statusline.main").statusline,
	})
end

return M
