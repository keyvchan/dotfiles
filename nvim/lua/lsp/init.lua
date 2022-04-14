require("lsp.keymap")
require("lsp.appearance")

require("lspconfig").rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},
		},
	},
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
