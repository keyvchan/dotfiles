local kanagawa = require("kanagawa.colors").setup({ theme = "wave" })

local colors = {
	black = "#272822",
	blue = "#71ace7",
	darkaqua = "#4EADE5",
	darkblue = "#081633",
	green = "#84F57D",
	magenta = "#d16d9e",
	pink = "#F93C80",
	purple = kanagawa.palette.springViolet1,
	yellow = "#FFFF43",
}

local bubble = { fg = colors.black, bg = colors.purple }
local transparent = { fg = colors.purple, bg = "none" }

local function theme_mode()
	return {
		a = { fg = colors.darkblue, bg = colors.purple, gui = "bold" },
		b = { fg = colors.magenta, bg = colors.darkblue },
		c = { fg = colors.black, bg = "none" },
	}
end

local theme = {
	normal = theme_mode(),
	insert = theme_mode(),
	visual = theme_mode(),
	replace = theme_mode(),
	command = theme_mode(),
	terminal = theme_mode(),
	inactive = theme_mode(),
}

local function gitsigns_diff()
	local status = vim.b.gitsigns_status_dict
	if not status then
		return nil
	end

	return {
		added = status.added or 0,
		modified = status.changed or 0,
		removed = status.removed or 0,
	}
end

local function first_item()
	return "▋"
end

local function bubble_space()
	return " "
end

local function right_cap()
	return ""
end

local function left_cap()
	return " "
end

local function lsp_status()
	return vim.lsp.status()
end

local function has_lsp_status()
	return vim.lsp.status() ~= ""
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16,
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"FileType",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
				"DiagnosticChanged",
				"LspProgress",
			},
		},
	},
	sections = {
		lualine_a = {
			{
				first_item,
				color = { fg = colors.blue, bg = colors.darkaqua },
				padding = 0,
			},
			{
				"mode",
			},
		},
		lualine_b = {
			{
				"filetype",
				colored = true,
				icon_only = true,
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				path = 1,
				shorting_target = function()
					return math.floor(vim.o.columns * 0.75)
				end,
				color = { fg = colors.magenta, bg = colors.darkblue },
				symbols = {
					modified = " ",
					readonly = " ",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
		},
		lualine_c = {
			{
				"branch",
				icon = "",
				color = { fg = colors.darkblue, bg = colors.purple },
			},
			{
				"diff",
				source = gitsigns_diff,
				color = bubble,
				diff_color = {
					added = { fg = colors.green, bg = colors.purple },
					modified = { fg = colors.yellow, bg = colors.purple },
					removed = { fg = colors.pink, bg = colors.purple },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				colored = false,
				color = bubble,
				symbols = {
					error = "✗ ",
					warn = " ",
					info = "ﯧ ",
					hint = " ",
				},
			},
			{
				lsp_status,
				cond = has_lsp_status,
				color = bubble,
			},
			{ bubble_space, color = bubble, padding = 0 },
			{ right_cap, color = transparent, padding = 0 },
		},
		lualine_x = {
			{ left_cap, color = transparent, padding = 0 },
			{
				"filetype",
				icons_enabled = false,
				fmt = string.upper,
				color = bubble,
			},
			{
				"encoding",
				fmt = string.upper,
				color = bubble,
			},
		},
		lualine_y = {
			{ "location", color = bubble },
		},
		lualine_z = {
			{ "progress", color = bubble },
		},
	},
})
