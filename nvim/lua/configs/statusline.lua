-- local gl = require("galaxyline")
-- -- local path = require("plenary.path")
-- local gls = gl.section
-- gl.short_line_list = { "TelescopeResults", "packer", "TelescopePrompt" }
--
-- local colors = {
-- 	bg = "#282c34",
-- 	cyan = "#008080",
-- 	darkblue = "#081633",
-- 	magenta = "#d16d9e",
-- 	blue = "#0087d7",
-- 	white = "#FFFFFF",
-- 	black = "#272822",
-- 	lightblack = "#2D2E27",
-- 	lightblack2 = "#383a3e",
-- 	arkblack = "#211F1C",
-- 	grey = "#8F908A",
-- 	lightgrey = "#575b61",
-- 	darkgrey = "#64645e",
-- 	warmgrey = "#75715E",
-- 	pink = "#F93C80",
-- 	green = "#84F57D",
-- 	aqua = "#66d9ef",
-- 	darkaqua = "#4EADE5",
-- 	yellow = "#FFFF43",
-- 	orange = "#FFBD37",
-- 	deepOrange = "#FF8C00",
-- 	purple = "#ae81ff",
-- 	darkpurple = "#855dcf",
-- 	red = "#FF1919",
-- 	darkred = "#F44747",
-- 	addfg = "#d7ffaf",
-- 	addbg = "#5f875f",
-- 	delbg = "#f75f5f",
-- 	changefg = "#d7d7ff",
-- 	changebg = "#5f5f87",
-- }
-- -- local colors = {
-- -- }
--
-- local buffer_not_empty = function()
-- 	if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
-- 		return true
-- 	end
-- 	return false
-- end
--
-- gls.left[1] = {
-- 	FirstElement = {
-- 		provider = function()
-- 			return "\u{258b}"
-- 		end,
-- 		highlight = { colors.blue, colors.darkaqua },
-- 	},
-- }
-- gls.left[2] = {
-- 	ViMode = {
-- 		provider = function()
-- 			local alias = {
-- 				n = "NORMAL",
-- 				no = "N·Operator Pending",
-- 				v = "Visual",
-- 				V = "V·Line",
-- 				["^V"] = "V·Block",
-- 				s = "Select",
-- 				S = "S·Line",
-- 				["^S"] = "S·Block",
-- 				i = "Insert",
-- 				R = "Replace",
-- 				Rv = "V·Replace",
-- 				c = "Command",
-- 				cv = "Vim Ex",
-- 				ce = "Ex",
-- 				r = "Prompt",
-- 				rm = "More",
-- 				["r?"] = "Confirm",
-- 				["!"] = "Shell",
-- 				t = "Terminal",
-- 			}
--
-- 			return "  " .. string.upper(alias[vim.fn.mode()] or "V-Block") .. " "
-- 		end,
-- 		separator = "\u{e0b0}" .. " ",
-- 		separator_highlight = {
-- 			colors.purple,
-- 			function()
-- 				if not buffer_not_empty() then
-- 					return colors.purple
-- 				end
-- 				return colors.darkblue
-- 			end,
-- 		},
-- 		highlight = { colors.darkblue, colors.purple, "bold" },
-- 	},
-- }
-- gls.left[3] = {
-- 	FileIcon = {
-- 		provider = "FileIcon",
-- 		condition = buffer_not_empty,
-- 		highlight = { require("galaxyline.providers.fileinfo").get_file_icon_color, colors.darkblue },
-- 	},
-- }
-- local function file_readonly()
-- 	if vim.bo.filetype == "help" then
-- 		return true
-- 	end
-- 	return vim.bo.readonly
-- end
-- local function file_with_icons(file, modified_icon, readonly_icon)
-- 	if vim.fn.empty(file) == 1 then
-- 		return ""
-- 	end
--
-- 	modified_icon = modified_icon or ""
-- 	readonly_icon = readonly_icon or ""
--
-- 	if file_readonly() then
-- 		file = readonly_icon .. " " .. file
-- 	end
--
-- 	if vim.bo.modifiable and vim.bo.modified then
-- 		file = file .. " " .. modified_icon
-- 	end
--
-- 	return " " .. file .. " "
-- end
--
-- local function filename()
-- 	local win_id = vim.fn.win_getid()
-- 	local buf_nr = vim.fn.winbufnr(win_id)
-- 	local buf_name = vim.fn.bufname(buf_nr)
-- 	local base_name = vim.fn.fnamemodify(buf_name, [[:~:.]])
-- 	local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(win_id)))
--
-- 	if string.len(base_name) <= space then
-- 		return file_with_icons(base_name) .. " "
-- 	else
-- 		return file_with_icons(vim.fn.pathshorten(base_name)) .. " "
-- 	end
-- end
--
-- gls.left[4] = {
-- 	FileName = {
-- 		provider = filename,
-- 		condition = buffer_not_empty,
-- 		highlight = { colors.magenta, colors.darkblue },
-- 	},
-- }
-- gls.left[5] = {
-- 	GitBranch = {
-- 		provider = "GitBranch",
-- 		icon = "  " .. "\u{f7a1}" .. " ",
-- 		-- separator = "\u{e0b0}",
-- 		-- separator_highlight = { colors.purple },
-- 		condition = function()
-- 			return buffer_not_empty and require("galaxyline.condition").check_git_workspace()
-- 		end,
-- 		separator = "\u{e0b0}",
-- 		separator_highlight = { colors.purple, colors.purple },
-- 		highlight = { colors.black, colors.purple },
-- 	},
-- }
--
-- gls.left[6] = {
-- 	DiffAdd = {
-- 		provider = "DiffAdd",
-- 		condition = function()
-- 			return buffer_not_empty and require("galaxyline.condition").check_git_workspace()
-- 		end,
-- 		icon = " " .. "\u{f457}" .. " ",
-- 		highlight = { colors.green, colors.purple },
-- 	},
-- }
-- gls.left[7] = {
-- 	DiffModified = {
-- 		provider = "DiffModified",
-- 		condition = function()
-- 			return buffer_not_empty and require("galaxyline.condition").check_git_workspace()
-- 		end,
-- 		icon = " " .. "\u{f459}" .. " ",
-- 		highlight = { colors.orange, colors.purple },
-- 	},
-- }
-- gls.left[8] = {
-- 	DiffRemove = {
-- 		provider = "DiffRemove",
-- 		icon = " " .. "\u{f458}" .. " ",
-- 		condition = function()
-- 			return buffer_not_empty and require("galaxyline.condition").check_git_workspace()
-- 		end,
-- 		highlight = { colors.red, colors.purple },
-- 	},
-- }
-- gls.left[9] = {
-- 	LeftEnd = {
-- 		provider = function()
-- 			return " " .. require("lsp-status").status() .. " "
-- 		end,
-- 		separator = "\u{e0b0}",
-- 		separator_highlight = { colors.purple, "NONE" },
-- 		highlight = { colors.black, colors.purple },
-- 	},
-- }
-- gls.right[1] = {
-- 	FileFormat = {
-- 		provider = "FileFormat",
-- 		separator = "\u{e0b2}",
-- 		separator_highlight = { colors.purple, "NONE" },
-- 		highlight = { colors.black, colors.purple },
-- 	},
-- }
-- gls.right[2] = {
-- 	LineInfo = {
-- 		provider = "LineColumn",
-- 		separator = " " .. "\u{e0b2}" .. " ",
-- 		separator_highlight = { colors.purple, colors.purple },
-- 		highlight = { colors.black, colors.purple },
-- 	},
-- }
-- gls.right[3] = {
-- 	ScrollBar = {
-- 		provider = "ScrollBar",
-- 		highlight = { colors.black, colors.purple },
-- 	},
-- }
--
-- gls.short_line_left[1] = {
-- 	BufferType = {
-- 		provider = "FileTypeName",
-- 		separator = "\u{e0b0}",
-- 		separator_highlight = { colors.purple, "NONE" },
-- 		highlight = { colors.black, colors.purple, "bold" },
-- 	},
-- }
--
-- gls.short_line_right[1] = {
-- 	BufferIcon = {
-- 		provider = "BufferIcon",
-- 		separator = "\u{e0b2}",
-- 		separator_highlight = { colors.purple },
-- 		highlight = { colors.black, colors.purple },
-- 	},
-- }
