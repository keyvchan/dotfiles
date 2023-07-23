local M = {
	-- lspconfig
	require("plugins.lsp.config"),

	-- completion
	require("plugins.lsp.completion"),

	-- status
	require("plugins.lsp.status"),

	-- mason
	require("plugins.lsp.mason"),

	-- null
	require("plugins.lsp.null-ls"),
}

return M
