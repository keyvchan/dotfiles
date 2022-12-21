local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason_lspconfig.setup({})

lspconfig.rust_analyzer.setup({
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
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})

lspconfig.pyright.setup({
	settings = {
		python = {
			pythonPath = "/usr/local/opt/python@3.11/bin/python3.11",
		},
	},
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.sourcekit.setup({
	settings = {},
	cmd = { "/Users/keyv/Codebases/AppcodeProjects/sourcekit-lsp/.build/debug/sourcekit-lsp" },
	filetypes = { "swift" },
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.clangd.setup({
	cmd = { "clangd", "--clang-tidy", "--offset-encoding=utf-16" },
	filetypes = { "c", "cpp" },
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.gopls.setup({
	settings = {
		gopls = {
			allExperiments = true,
			staticcheck = true,
		},
	},
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})

lspconfig.hls.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.denols.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.yamlls.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.jsonls.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.cmake.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.jdtls.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.zls.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
-- lspconfig.sourcery.setup({
-- 	init_options = {
-- 		token = "user_7Tv1LR2ajLCZUe_Mu4frLJ34t_9m3ZxC0HTsnMYjLjyHCqVs_yReWheQe4s",
-- 	},
-- 	on_attach = require("lsp.capabilities").on_attach,
-- 	capabilities = require("lsp.capabilities").capabilities,
-- })
lspconfig.ltex.setup({
	filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.taplo.setup({
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
