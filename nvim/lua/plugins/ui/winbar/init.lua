local M = {
	"Bekaboo/dropbar.nvim",
	event = "UIEnter",
}

function M.config()
	require("dropbar").setup()
end

return M
