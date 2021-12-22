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
	-- Enable underline, use default values
	underline = true,
	-- Enable virtual text, override spacing to 4
	virtual_text = { spacing = 4, source = "always" },
	-- Use a function to dynamically turn signs off
	-- and on, using buffer local variables
	-- Disable a feature
	update_in_insert = true,
})

local on_attach = function(client)
	lsp_status.on_attach(client)
	require("lsp.signature_help")
end

-- lua
local sumneko_root_path = "/Users/keyv/Codebases/ClionProjects/lua-language-server"
nvim_lsp.sumneko_lua.setup({
	cmd = { "lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
	on_attach = on_attach,
	settings = {
		Lua = {
			completion = {
				-- keywordSnippet = "Disable";
			},
			runtime = { version = "LuaJIT" },
			diagnostics = {
				enable = true,
				globals = {
					"vim",
					"Color",
					"c",
					"Group",
					"g",
					"s",
					"describe",
					"it",
					"before_each",
					"after_each",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
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
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.clangd.setup({
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	init_options = { clangdFileStatus = true },
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.dockerls.setup({
	cmd = { "node", "docker-language-server", "--stdio" },
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
			analysis = {
				disableOrganizeImports = false,
				useLibraryCodeForTypes = true,
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
nvim_lsp.denols.setup({ on_attach = on_attach, capabilities = capabilities })
nvim_lsp.texlab.setup({
	filetypes = { "tex", "bib", "plaintex" },
	settings = {
		forwardSearch = { args = { "%l", "%p", "%f" } },
		chktex = { onEdit = true, onOpenAndSave = true },
		lint = { onChange = true },
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	capabilities = capabilities,
})