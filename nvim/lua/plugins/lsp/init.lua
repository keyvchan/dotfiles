local M = {
	-- completion
	require("plugins.lsp.completion"),

	-- null
	require("plugins.lsp.null-ls"),
}

require("plugins.lsp.config.lsp")
require("plugins.lsp.config.diagnostic")

return M
