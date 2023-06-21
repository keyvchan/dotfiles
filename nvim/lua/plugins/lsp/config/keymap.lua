-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
