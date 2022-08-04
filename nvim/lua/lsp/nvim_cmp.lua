local cmp = require("cmp")
local compare = require("cmp.config.compare")

cmp.setup({
	performance = {
		debounce = 20,
		throttle = 50,
	},
	preselect = cmp.PreselectMode.None,
	mapping = {
		["<C-p>"] = cmp.mapping(
			cmp.mapping.select_prev_item({
				behavior = cmp.SelectBehavior.Insert,
			}),
			{ "i", "s", "c" }
		),
		["<C-n>"] = cmp.mapping(
			cmp.mapping.select_next_item({
				behavior = cmp.SelectBehavior.Insert,
			}),
			{ "i", "s", "c" }
		),

		["<C-Space>"] = cmp.mapping.complete({}),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
	},
	snippet = cmp.config.disable,
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	sources = {
		{ name = "nvim_lsp", priority = 100 },
		{ name = "neorg" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
	},
	sorting = {
		comparators = {
			compare.score,
			compare.locality,
			compare.sort_text,
			compare.socpe,
			compare.recent_used,
			compare.offset,
		},
	},

	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol",
			-- symbols = "codicons",
			preset = "codicons",
			menu = {},
		}),
		fields = {
			"kind",
			"abbr",
			"menu",
		},
	},

	experimental = {
		ghost_text = false,
	},
})

-- Use buffer source for `/`.
require("cmp").setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
require("cmp").setup.cmdline(":", {
	sources = require("cmp").config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
