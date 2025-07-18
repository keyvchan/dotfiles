local source_priority = {
	lsp = 3,
	path = 2,
	buffer = 1,
}

local M = {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },

	version = "*",

	opts = {
		fuzzy = {
			sorts = {
				function(a, b)
					local a_priority = source_priority[a.source_id]
					local b_priority = source_priority[b.source_id]
					if a_priority ~= b_priority then
						return a_priority > b_priority
					end
				end,
				"score",
				"sort_text",
			},
		},
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
			menu = {
				border = "none",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
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
				["CR"] = { "fallback" },
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
