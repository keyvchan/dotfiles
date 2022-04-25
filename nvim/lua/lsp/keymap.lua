-- diagnostic
vim.keymap.set("n", "<C-p>", function()
	vim.diagnostic.goto_prev({ float = { show_header = true } })
end)
vim.keymap.set("n", "<C-n>", function()
	vim.diagnostic.goto_next({ float = { show_header = true } })
end)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc)
