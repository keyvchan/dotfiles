local source_priority = {
	lsp = 3,
	cmdline = 3,
	path = 2,
	buffer = 1,
}
local ui = require("configs.ui")

local function cmdline_position()
	local position = ui.cmdline_cursor_position()
	local ok, menu = pcall(require, "blink.cmp.completion.windows.menu")
	if not ok or menu.context == nil or menu.renderer == nil then
		return position
	end

	position[2] = position[2] - menu.context.bounds.start_col + menu.renderer:get_alignment_start_col()
	return position
end

require("blink.cmp").setup({
	fuzzy = {
		sorts = {
			function(a, b)
				local a_priority = source_priority[a.source_id] or 0
				local b_priority = source_priority[b.source_id] or 0
				if a_priority ~= b_priority then
					return a_priority > b_priority
				end
			end,
			"score",
			"sort_text",
		},
		implementation = "prefer_rust",
		-- prebuilt_binaries = {
		-- 	force_version = "*",
		-- },
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
			cmdline_position = cmdline_position,
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
			["<CR>"] = { "fallback" },
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
})
