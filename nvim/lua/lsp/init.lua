local nvim_lsp = require("lspconfig")
-- local signature_help = require("lsp_signature")
local lsp_status = require("lsp-status")

-- require("lsp.nvim_cmp")
require("lsp.keymap")
require("lsp.appearance")

lsp_status.config({
	status_symbol = " ",
	indicator_info = "‼ ",
	indicator_errors = "✗",
	indicator_hint = "ﯧ ",
	indicator_warnings = " ",
})
lsp_status.register_progress()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = { spacing = 4, source = "always" },
	update_in_insert = true,
})

local on_attach = function(client)
	lsp_status.on_attach(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

-- lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	capabilities = capabilities,
})

nvim_lsp.sourcekit.setup({
	settings = { serverArguments = { "--completion-server-side-filtering" } },
	on_attach = on_attach,
	cmd = { "xcrun", "sourcekit-lsp" },
	filetypes = { "swift" },
	capabilities = capabilities,
})
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.rust_analyzer.setup({
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
	on_attach = on_attach,
	capabilities = capabilities,
})

local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = { "utf-16" }
nvim_lsp.clangd.setup({
	cmd = { "clangd", "--clang-tidy" },
	init_options = { clangdFileStatus = true },
	on_attach = on_attach,
	capabilities = clangd_capabilities,
})

-- nvim_lsp.clangd.setup({
-- 	cmd = { "/Users/keyv/Codebases/ClionProjects/tsls/target/debug/tsls" },
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

nvim_lsp.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cmake.setup({
	cmd = {
		"node",
		"cmake-language-server",
		"--stdio",
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.bashls.setup({ on_attach = on_attach })

nvim_lsp.pyright.setup({
	settings = {
		python = {
			pythonPath = "/usr/local/opt/python@3.10/bin/python3",
			-- pythonPath = "/usr/local/opt/python@3.10/bin/python3",
			analysis = {
				disableOrganizeImports = false,
				useLibraryCodeForTypes = true,
				autoImportCompletions = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

-- nvim_lsp.pylsp.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

nvim_lsp.vimls.setup({ on_attach = on_attach, capabilities = capabilities })

nvim_lsp.denols.setup({
	on_attach = on_attach,
	init_options = {
		lint = true,
		unstable = true,
	},
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	capabilities = capabilities,
})
