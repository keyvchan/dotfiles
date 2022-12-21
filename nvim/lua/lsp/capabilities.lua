M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = { spacing = 4, source = "always" },
	update_in_insert = true,
})

M.on_attach = function(client, bufnr)
	-- require("aerial").on_attach(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil
	-- client.resolved_capabilities.document_formatting = false
	-- client.resolved_capabilities.document_range_formatting = false
end

return M
