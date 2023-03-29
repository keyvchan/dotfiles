local M = { "stevearc/dressing.nvim", event = "VeryLazy" }

function M.config()
	require("dressing").setup({
		select = {
			backend = "telescope",
			winblend = 0,
			telescope = require("telescope.themes").get_cursor(),
			builtin = {
				relative = "cursor",
			},
		},
		input = {
			win_options = {
				winblend = 0,
				winhighlight = "NormalFloat:Normal",
			},
		},
	})
end

return M
