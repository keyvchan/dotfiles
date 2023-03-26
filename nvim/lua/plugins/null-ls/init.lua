local M = {
	"jay-babu/mason-null-ls.nvim",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"williamboman/mason.nvim",
	},
	event = "VeryLazy",
}

function M.config()
	local null_ls = require("null-ls")

	require("null-ls").setup({
		sources = {
			-- formatting
			null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.clang_format.with({
				filetypes = { "cpp", "c" },
			}),
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier.with({
				extra_filetypes = { "markdown", "toml" },
			}),
			null_ls.builtins.formatting.shfmt.with({
				extra_filetypes = { "zsh" },
			}),
			null_ls.builtins.formatting.swiftformat,

			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.zigfmt,

			-- diagnostics
			-- null_ls.builtins.diagnostics.golangci_lint,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.diagnostics.checkmake,

			-- code actions
			null_ls.builtins.hover.dictionary.with({
				extra_filetypes = { "norg", "gitcommit" },
			}),
		},
	})
	require("mason-null-ls").setup()
end

return M
