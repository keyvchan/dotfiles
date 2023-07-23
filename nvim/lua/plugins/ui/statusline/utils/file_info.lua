local M = {}

local conditions = require("heirline.conditions")
local u = require("plugins.ui.statusline.utils.colors")

M.file_encoding = {
	provider = function()
		return string.format(" %s ", vim.bo.fileencoding)
	end,
	hl = {
		fg = u.colors.black,
		bg = u.colors.purple,
	},
}

M.file_type = {
	provider = function()
		return string.format(" %s ", vim.bo.filetype:upper())
	end,
	hl = {
		fg = u.colors.black,
		bg = u.colors.purple,
	},
}

M.file_name_block = {
	-- let's first set up some attributes needed by this component and it's children
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}
-- We can now define some children separately and add them later

M.file_icon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return " " .. self.icon .. " "
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

M.file_name = {
	provider = function(self)
		-- first, trim the pattern relative to the current directory. For other
		-- options, see :h filename-modifers
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]" .. " "
		end
		-- now, if the filename would occupy more than 1/4th of the available
		-- space, we trim the file path to its initials
		-- See Flexible Components section below for dynamic truncation
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename .. " "
	end,
	hl = {
		fg = u.colors.magenta,
		bg = u.colors.darkblue,
	},
}

M.file_flags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "" .. " ",
		hl = {
			fg = u.colors.magenta,
			bg = u.colors.darkblue,
		},
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "" .. " ",
		hl = {
			fg = u.colors.magenta,
			bg = u.colors.darkblue,
		},
	},
}

M.cur_position = {
	provider = function()
		-- TODO: What about 4+ diget line numbers?
		return string.format(" %3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
	end,
	hl = {
		fg = u.colors.black,
		bg = u.colors.purple,
	},
}
M.cur_percent = {
	provider = function()
		return " %P" .. " "
	end,
	hl = {
		fg = u.colors.black,
		bg = u.colors.purple,
	},
}
return M
