local group = vim.api.nvim_create_augroup("fmt", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.formatting_sync(nil, 4000)
	end,
	group = group,
})
