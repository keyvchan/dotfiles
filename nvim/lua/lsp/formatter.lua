M = {}
M.setup = function(client)
	if client.resolved_capabilities.document_formatting or client.resolved_capabilities.document_range_formatting then
		local group = vim.api.nvim_create_augroup("fmt", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.formatting_sync(nil, 4000)
			end,
			group = group,
		})
	end
end
return M
