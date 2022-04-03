local u = require("statusline.colors")
local fmt = string.format

local c = {
	FirstElement = {
		provider = function()
			return "\u{258b}"
		end,
		hl = {
			fg = u.colors.blue,
			bg = u.colors.darkaqua,
		},
	},
	vimode = {
		provider = function()
			return string.format(" %s ", u.vi.text[vim.fn.mode()])
		end,
		hl = {
			fg = u.colors.darkblue,
			bg = u.colors.purple,
			style = "bold",
		},
		right_sep = { str = "\u{e0b0}", hl = {
			fg = u.colors.purple,
			bg = u.colors.darkblue,
		} },
	},
	gitbranch = {
		provider = "git_branch",
		icon = " \u{e702} ",
		hl = {
			fg = u.colors.darkblue,
			bg = u.colors.purple,
		},
		enabled = function()
			return require("feline.providers.git").git_info_exists()
		end,
	},
	git_add = {
		provider = "git_diff_added",
		icon = " \u{f457} ",
		hl = {
			fg = u.colors.green,
			bg = u.colors.purple,
		},
		enabled = function()
			return require("feline.providers.git").git_info_exists()
		end,
	},
	git_removed = {
		provider = "git_diff_removed",
		icon = " \u{f458} ",
		hl = {
			fg = u.colors.pink,
			bg = u.colors.purple,
		},
		enabled = function()
			return require("feline.providers.git").git_info_exists()
		end,
	},
	git_changed = {
		provider = "git_diff_changed",
		icon = " \u{f459} ",
		hl = {
			fg = u.colors.yellow,
			bg = u.colors.purple,
		},
		enabled = function()
			return require("feline.providers.git").git_info_exists()
		end,
	},
	left_arrow_file_type = {
		provider = function()
			return "\u{e0b2}"
		end,
		hl = {
			fg = u.colors.purple,
			bg = "NONE",
		},
	},
	file_type = {
		provider = function()
			return fmt(" %s ", vim.bo.filetype:upper())
		end,
		hl = {
			fg = u.colors.black,
			bg = u.colors.purple,
		},
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative-short",
			},
		},
		hl = {
			fg = u.colors.magenta,
			bg = u.colors.darkblue,
		},
		left_sep = {
			str = " ",
			hl = {
				fg = u.colors.darkblue,
				bg = u.colors.darkblue,
			},
		},
		right_sep = {
			str = " ",
			hl = {
				fg = u.colors.darkblue,
				bg = u.colors.darkblue,
			},
		},
	},
	right_arrow_file_info = {
		provider = function()
			return "\u{e0b0}"
		end,
		hl = {
			fg = u.colors.darkblue,
			bg = u.colors.purple,
		},
	},
	file_enc = {
		provider = function()
			return fmt(" %s ", vim.bo.fileencoding)
		end,
		hl = {
			fg = u.colors.black,
			bg = u.colors.purple,
		},
		left_sep = {
			str = "\u{e0b3}",
			hl = {
				fg = u.colors.darkblue,
				bg = u.colors.purple,
			},
		},
	},
	cur_position = {
		provider = function()
			-- TODO: What about 4+ diget line numbers?
			return fmt(" %3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
		end,
		hl = {
			fg = u.colors.black,
			bg = u.colors.purple,
		},
		left_sep = {
			str = "\u{e0b3}",
			hl = {
				fg = u.colors.black,
				bg = u.colors.purple,
			},
		},
	},
	cur_percent = {
		provider = function()
			return " " .. require("feline.providers.cursor").line_percentage() .. "  "
		end,
		hl = {
			fg = u.colors.black,
			bg = u.colors.purple,
		},
		left_sep = {
			str = "\u{e0b3}",
			hl = {
				fg = u.colors.black,
				bg = u.colors.purple,
			},
		},
	},
	lsp_status = {
		provider = function()
			return require("lsp-status").status()
		end,
		hl = {
			fg = u.colors.black,
			bg = u.colors.purple,
		},
		right_sep = {
			str = " ",
			hl = {
				fg = u.colors.purple,
				bg = u.colors.purple,
			},
		},
	},
	right_arrow_lsp_status = {
		provider = function()
			return "\u{e0b0}"
		end,
		hl = {
			fg = u.colors.purple,
			bg = "NONE",
		},
	},

	in_position = {
		provider = "position",
		hl = {
			fg = u.colors.darkblue,
			bg = u.colors.purple,
		},
	},
	empty = {
		provider = "",
		hl = {
			fg = "NONE",
			bg = "NONE",
		},
	},
}

local active = {
	{ -- left
		c.FirstElement,
		c.vimode,
		c.fileinfo,
		c.right_arrow_file_info,
		c.gitbranch,
		c.git_add,
		c.git_removed,
		c.git_changed,
		c.lsp_status,
		c.right_arrow_lsp_status,
		c.empty,
	},
	{
		c.empty,
	},
	{ -- right
		c.empty,
		c.left_arrow_file_type,
		c.file_type,
		c.file_enc,
		c.cur_position,
		c.cur_percent,
	},
}

-- local inactive = {
-- 	{
-- 		c.FirstElement,
-- 		c.fileinfo,
-- 		c.right_arrow_file_info,
-- 		c.empty,
-- 	}, -- left
-- 	{ c.in_position }, -- right
-- }

require("feline").setup({
	components = { active = active, inactive = active },
	highlight_reset_triggers = {},
})
