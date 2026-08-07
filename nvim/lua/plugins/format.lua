require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
		python = { "ruff_format" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		swift = { "swift" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
