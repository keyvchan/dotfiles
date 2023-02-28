local M = {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
	},
}

function M.config()
	require("mason").setup({
		ui = {
			keymaps = {
				apply_language_filter = "/",
			},
		},
	})
	require("mason-lspconfig").setup()
end

return M
