local group = vim.api.nvim_create_augroup("inlay_hint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "bufWinEnter" }, {
	callback = function()
		require("vim.lsp._inlay_hint").refresh()
	end,
	group = group,
})
