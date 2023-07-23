local M = {
	"lewis6991/satellite.nvim",

	event = "UIEnter",
}

M.config = function()
	require("satellite").setup()
end

return M
