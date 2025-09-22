local M = {}

local utils = require("heirline.utils")
local file_info = require("plugins.statusline.utils.file_info")
local u = require("plugins.statusline.utils.colors")

local right_arrow = {
	provider = function()
		return "\u{e0c4}"
	end,
	hl = {
		fg = u.colors.darkblue,
		bg = u.colors.purple,
	},
	update = function()
		return false
	end,
}

-- let's add the children to our FileNameBlock component
M = utils.insert(
	file_info.file_name_block,
	file_info.file_icon,
	file_info.file_name,
	file_info.file_flags,
	right_arrow,
	{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space,
)

return M
