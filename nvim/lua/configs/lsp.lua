vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.enable({ "gopls", "clangd", "luals", "rust-analyzer", "sourcekit" })

vim.lsp.inlay_hint.enable(true)

vim.keymap.set({ "n" }, "<leader>lca", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true })

-- diagnostic keymap
vim.keymap.set("n", "<C-p>", function()
	vim.diagnostic.jump({
		count = -1,
		float = {
			show_header = true,
		},
	})
end)

vim.keymap.set("n", "<C-n>", function()
	vim.diagnostic.jump({
		count = 1,
		float = { show_header = true },
	})
end)

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
