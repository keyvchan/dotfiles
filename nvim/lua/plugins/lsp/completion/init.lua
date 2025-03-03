local M = {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },

	version = "*",

	opts = {
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
		},
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "fallback" },
			["<C-e>"] = { "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "buffer" },
			providers = {
				lsp = {
					fallbacks = {},
				},
				path = {
					opts = {
						trailing_slash = true,
						label_trailing_slash = true,
					},
				},
			},
		},
		signature = { enabled = true },
		cmdline = {
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				menu = { auto_show = true },
			},
		},
	},
	opts_extend = { "sources.default" },
}

return M
