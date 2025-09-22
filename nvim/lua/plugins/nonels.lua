local null_ls = require("null-ls")

require("null-ls").setup({
	debug = true,
	sources = {
		-- formatting
		null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.clang_format.with({
		--   filetypes = { "cpp", "c" },
		-- }),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd.with({
			extra_filetypes = { "toml" },
		}),
		null_ls.builtins.formatting.shfmt.with({
			extra_filetypes = { "zsh" },
		}),
		null_ls.builtins.formatting.swiftformat,

		null_ls.builtins.formatting.goimports,

		-- diagnostics
		-- null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.checkmake,

		-- code actions
		null_ls.builtins.hover.dictionary.with({
			extra_filetypes = { "norg", "gitcommit" },
		}),
	},
})

local group = vim.api.nvim_create_augroup("fmt", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local have_nls = #require("null-ls.sources").get_available(vim.bo.filetype, "NULL_LS_FORMATTING") > 0

		if have_nls then
			vim.lsp.buf.format({
				timeout_ms = 4000,
				filter = function(client)
					-- if has null-ls, format with null-ls, if not, format with lsp
					return client.name == "null-ls"
				end,
			})
		else
			vim.lsp.buf.format()
		end
	end,
	group = group,
})
