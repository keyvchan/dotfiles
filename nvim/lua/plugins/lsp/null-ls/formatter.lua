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
			-- vim.api.nvim_feedkeys("gg=G", "n", false)
			-- vim.api.nvim_feedkeys("``", "n", false)
			-- [FIXME]: temporary fix for noice.nvim accidentally breaking indent behavior
			-- vim.cmd("normal! gg=G")
			-- vim.cmd("normal! ``")
		end
	end,
	group = group,
})
