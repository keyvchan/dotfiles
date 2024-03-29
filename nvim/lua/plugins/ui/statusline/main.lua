local M = {}

local common = require("plugins.ui.statusline.utils.common")
local u = require("plugins.ui.statusline.utils.colors")

local first_item = {
	provider = function()
		return "\u{258b}"
	end,
	hl = {
		fg = u.colors.blue,
		bg = u.colors.darkaqua,
	},

	-- don't update it
	update = function()
		return false
	end,
}
local vimode = {

	provider = function()
		return string.format(" %s ", u.vi.text[vim.fn.mode()])
	end,
	hl = {
		fg = u.colors.darkblue,
		bg = u.colors.purple,
		bold = true,
	},
	{
		provider = "\u{e0c4}",
		hl = {
			fg = u.colors.purple,
			bg = u.colors.darkblue,
		},
	},
	update = {
		"ModeChanged",
	},
}

local default_line = {
	first_item,
	vimode,
	require("plugins.ui.statusline.file_name"),
	require("plugins.ui.statusline.git").git,
	require("plugins.ui.statusline.lsp").diagnostics,
	require("plugins.ui.statusline.lsp").progress,
	common.right_arrow_fire,
	common.align,

	common.left_arrow_fire,
	require("plugins.ui.statusline.utils.file_info").file_type,
	require("plugins.ui.statusline.utils.file_info").file_encoding,
	require("plugins.ui.statusline.utils.file_info").cur_position,
	require("plugins.ui.statusline.utils.file_info").cur_percent,
}

M.statusline = {
	fallthrough = false,
	default_line,
}

return M
