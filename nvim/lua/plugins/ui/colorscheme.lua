local M = {
	{
		"keyvchan/monokai.nvim",
		enabled = false,
		config = function()
			-- vim.cmd.colorscheme("monokai")
		end,
	},
	{
		"sainnhe/sonokai",
		enabled = false,
		init = function()
			vim.sonokai_style = "andromeda"
			vim.g.sonokai_enable_italic = 1
			vim.g.sonokai_transparent_background = 2
			vim.g.sonokai_diagnostic_text_highlight = 0
			vim.g.sonokai_diagnostic_virtual_text = "colored"
			vim.g.sonokai_better_performance = 1
		end,
		config = function()
			-- vim.cmd.colorscheme("sonokai")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		event = "UIEnter",
		config = function()
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				transparent = true, -- do not set background color
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- NormalFloat = { bg = "none" },
						-- FloatBorder = { bg = "none" },
						-- FloatTitle = { bg = "none" },
						-- SignColumn = { bg = "none" },
						-- StatusLineNC = { bg = "none" },
						-- Statusline = { bg = "none" },
						-- LineNr = { fg = theme.ui.special, bg = "none" },
						-- NoiceCmdLineBorder = { bg = "none" },
						-- NoiceCmdlinePopupBorder = { bg = "none" },

						-- NormalDark = { fg = theme.ui.fg_dim },

						-- WinSeparator = { fg = theme.ui.special },

						-- LazyNormal = { fg = theme.ui.fg_dim },
						-- MasonNormal = { fg = theme.ui.fg_dim },

						-- TelescopeTitle = { fg = theme.ui.special, bold = true },
						-- TelescopePromptBorder = { fg = theme.ui.special },
						-- TelescopeResultsNormal = { fg = theme.ui.special },
						-- TelescopeResultsBorder = { fg = theme.ui.special },
						-- TelescopePreviewBorder = { fg = theme.ui.special },

						-- BufferLineFill = { bg = "none" },
						-- TabLineFill = { bg = "none" },
						-- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
						-- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						-- PmenuSbar = { bg = theme.ui.bg_m1 },
						-- PmenuThumb = { bg = theme.ui.bg_p2 },

						-- DiagnosticSignInfo = { bg = "none" },
						-- DiagnosticSignWarn = { bg = "none" },
						-- DiagnosticSignError = { bg = "none" },
						-- DiagnosticSignHint = { bg = "none" },
					}
				end,
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}

return M
