local cmp = require("cmp")
local compare = require("cmp.config.compare")

cmp.setup({
	appearence = {
		menu = {
			direction = "above",
		},
	},
	snippet = cmp.config.disable,

	preselect = cmp.PreselectMode.None,
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Insert,
		}),
		["<C-n>"] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Insert,
		}),

		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
	}),

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
			with_text = false,
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
