local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = " " }
-- Automatically update diagnostics
vim.diagnostic.config({
	underline = true,
	update_in_insert = true,
	virtual_text = {
		virt_text_pos = "eol_right_align",
		spacing = 4,
		source = "if_many",
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},
})
