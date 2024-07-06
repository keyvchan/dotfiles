local M = {
	"lewis6991/satellite.nvim",

	event = "UIEnter",
}

M.config = function()
	require("satellite").setup({
		winblend = 0,
	})
end

return M
