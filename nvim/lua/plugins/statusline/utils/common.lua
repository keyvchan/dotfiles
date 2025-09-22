local M = {}
local u = require("plugins.statusline.utils.colors")

M.left_arrow_fire = {
	provider = function()
		return "\u{e0c7} "
	end,
	hl = {
		fg = u.colors.purple,
		bg = "NONE",
	},
}

M.right_arrow_fire = {
	provider = function()
		return "\u{e0c6}"
	end,
	hl = {
		fg = u.colors.purple,
		bg = "NONE",
	},
}

M.align = {
	provider = "%=",
	hl = {
		bg = "NONE",
	},
}

return M
