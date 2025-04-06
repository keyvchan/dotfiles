vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.enable({ "gopls", "clangd", "luals" })

vim.lsp.inlay_hint.enable(true)
