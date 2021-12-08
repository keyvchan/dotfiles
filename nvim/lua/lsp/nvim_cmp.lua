local cmp = require("cmp")
local compare = require("cmp.config.compare")

cmp.setup({
	appearence = {
		menu = {
			direction = "above",
		},
	},
	snippet = false,

	preselect = cmp.PreselectMode.None,
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Insert,
		}),
		["<C-n>"] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Insert,
		}),

		["<C-Space>"] = cmp.mapping.complete(),
		["<C-d>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
	},

	sources = {
		{ name = "nvim_lsp", priority = 100 },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "neorg" },
		{ name = "nvim_lua" },
	},
	sorting = {
		comparators = {
			function(...)
				return require("cmp_buffer"):compare_locality(...)
			end,
			compare.score,
			compare.exact,
			compare.recent_used,
			compare.length,
		},
	},

	formatting = {
		format = require("lspkind").cmp_format({
			with_text = false,
			menu = {
				-- buffer = "[B]",
				-- nvim_lsp = "[LSP]",
				-- luasnip = "[LuaSnip]",
				-- nvim_lua = "[Lua]",
				-- latex_symbols = "[Latex]",
			},
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
