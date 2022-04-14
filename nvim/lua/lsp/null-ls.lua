local null_ls = require("null-ls")

require("null-ls").setup({
	sources = {
		-- formatting
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.goimports,

		-- diagnostics
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.shellcheck,

		-- code actions
		null_ls.builtins.hover.dictionary.with({
			extra_filetypes = { "norg" },
		}),
	},
})

-- require("lsp.formatter")
