local nvim_lsp = require("lspconfig")
local lsp_status = require("lsp-status")
-- local signature_help = require("lsp_signature")

require("lsp.nvim_cmp")
require("lsp.keymap")

lsp_status.config({
	status_symbol = " ",
	indicator_info = "‼ ",
	indicator_errors = "✗",
	indicator_hint = "ﯧ ",
	indicator_warnings = " ",
})
lsp_status.register_progress()

nvim_lsp.util.default_config.capabilities = vim.tbl_extend(
	"keep",
	nvim_lsp.util.default_config.capabilities or {},
	lsp_status.capabilities,
	require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
)

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

require("lsp.appearence")

local on_attach = function(client)
	lsp_status.on_attach(client)
	require("lsp.signature_help")
end

local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

-- lua
local sumneko_root_path = "/Users/keyv/Codebases/ClionProjects/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
nvim_lsp.sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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
})

nvim_lsp.sourcekit.setup({
	settings = { serverArguments = { "--completion-server-side-filtering" } },
	on_attach = on_attach,
	cmd = { "xcrun", "sourcekit-lsp" },
	filetypes = { "swift" },
})
nvim_lsp.gopls.setup({
	on_attach = on_attach,
})
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
})

nvim_lsp.clangd.setup({
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	init_options = { clangdFileStatus = true },
	on_attach = on_attach,
})

nvim_lsp.dockerls.setup({
	cmd = { "node", "docker-language-server", "--stdio" },
	on_attach = on_attach,
})

nvim_lsp.cmake.setup({
	cmd = {
		"node",
		"cmake-language-server",
		"--stdio",
	},
	on_attach = on_attach,
})

nvim_lsp.bashls.setup({ on_attach = on_attach })

nvim_lsp.pyright.setup({
	settings = {
		python = {
			pythonPath = "/usr/local/opt/python@3.10/bin/python3",
			analysis = {
				disableOrganizeImports = false,
			},
		},
	},
	on_attach = on_attach,
})

nvim_lsp.vimls.setup({ on_attach = on_attach })
nvim_lsp.denols.setup({ on_attach = on_attach })
nvim_lsp.texlab.setup({
	filetypes = { "tex", "bib", "plaintex" },
	settings = {
		forwardSearch = { args = { "%l", "%p", "%f" } },
		chktex = { onEdit = true, onOpenAndSave = true },
		lint = { onChange = true },
	},
	on_attach = on_attach,
})

nvim_lsp.yamlls.setup({})
nvim_lsp.diagnosticls.setup({
	filetypes = { "go", "python" },
})
nvim_lsp.tsserver.setup({})

nvim_lsp.ltex.setup({
	cmd = { "/Users/keyv/.local/bin/ltex-ls/bin/ltex-ls" },
	filetypes = { "tex", "bib", "markdown", "text" },
	settings = {
		completionEnabled = true,
	},
})
