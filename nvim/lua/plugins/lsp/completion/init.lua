local M = {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },

	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		completion = { list = { selection = "auto_insert" } },
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}

return M
