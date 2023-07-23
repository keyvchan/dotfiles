local M = {
	"Bekaboo/dropbar.nvim",
	event = "UIEnter",
	commit = "19011d96959cd40a7173485ee54202589760caae",
}

function M.config()
	require("dropbar").setup()
end

return M
