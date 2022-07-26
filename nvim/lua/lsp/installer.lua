local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({})
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
			pythonPath = "/usr/local/opt/python@3.10/bin/python3",
		},
	},
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.sourcekit.setup({
	settings = {},
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift" },
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.clangd.setup({
	cmd = { "clangd", "--clang-tidy", "--offset-encoding=utf-16" },
	filetypes = { "cpp" },
	on_attach = require("lsp.capabilities").on_attach,
	capabilities = require("lsp.capabilities").capabilities,
})
lspconfig.gopls.setup({
	init_options = {
		usePlaceholders = false,
	},
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
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
