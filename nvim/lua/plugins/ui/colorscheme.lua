local M = {
	{
		"keyvchan/monokai.nvim",
		lazy = true,
		config = function()
			-- vim.cmd.colorscheme("monokai")
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
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						SignColumn = { bg = "none" },
						LineNr = { fg = theme.ui.special, bg = "none" },
						NoiceCmdLineBorder = { bg = "none" },
						NoiceCmdlinePopupBorder = { bg = "none" },

						NormalDark = { fg = theme.ui.fg_dim },

						WinSeparator = { fg = theme.ui.special },

						LazyNormal = { fg = theme.ui.fg_dim },
						MasonNormal = { fg = theme.ui.fg_dim },

						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptBorder = { fg = theme.ui.special },
						TelescopeResultsNormal = { fg = theme.ui.special },
						TelescopeResultsBorder = { fg = theme.ui.special },
						TelescopePreviewBorder = { fg = theme.ui.special },

						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },

						DiagnosticSignInfo = { bg = "none" },
						DiagnosticSignWarn = { bg = "none" },
						DiagnosticSignError = { bg = "none" },
						DiagnosticSignHint = { bg = "none" },
					}
				end,
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}

return M
