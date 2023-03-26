local M = {
	"williamboman/mason-lspconfig.nvim",

	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				keymaps = {
					apply_language_filter = "/",
				},
			},
		})
		require("mason-lspconfig").setup()
	end,
  event = "VeryLazy"
	-- lazy = false,
}

return M
