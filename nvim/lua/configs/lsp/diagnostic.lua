local icons = require("configs.icons").diagnostics

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
			[vim.diagnostic.severity.ERROR] = icons.error,
			[vim.diagnostic.severity.WARN] = icons.warn,
			[vim.diagnostic.severity.HINT] = icons.hint,
			[vim.diagnostic.severity.INFO] = icons.info,
		},
	},
})
