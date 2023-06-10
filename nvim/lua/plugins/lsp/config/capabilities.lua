M = {}

local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
-- default_capabilities.textDocument.semanticTokens = vim.NIL
-- default_capabilities.workspace.semanticTokens = vim.NIL
M.capabilities = default_capabilities

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	underline = true,
-- 	virtual_text = { spacing = 4, source = "always" },
-- 	update_in_insert = true,
-- })

return M
