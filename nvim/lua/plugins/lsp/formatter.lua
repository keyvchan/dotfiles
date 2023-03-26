local group = vim.api.nvim_create_augroup("fmt", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local have_nls = #require("null-ls.sources").get_available(vim.bo.filetype, "NULL_LS_FORMATTING") > 0

		if have_nls then
			vim.lsp.buf.format({
				timeout_ms = 4000,
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		else
			vim.api.nvim_feedkeys("gg=G``", "n", true)
		end
	end,
	group = group,
})
