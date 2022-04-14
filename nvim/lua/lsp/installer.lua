local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {}

	opts.capilities = require("lsp.capabilities").capabilities
	opts.on_attach = require("lsp.capabilities").on_attach
	if server.name == "sumneko_lua" then
		opts = require("lua-dev").setup({
			lspconfig = vim.tbl_deep_extend("force", opts, {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "P" },
						},
					},
				},
			}),
		})
	end
	if server.name == "pyright" then
		opts.settings = {
			python = {
				pythonPath = "/usr/local/opt/python@3.10/bin/python3",
			},
		}
	end
	if server.name == "sourcekit" then
		opts.settings = {
			serverArguments = { "--completion-server-side-filtering" },
		}
		opts.cmd = { "xcrun", "sourcekit-lsp" }
	end

	if server.name == "clangd" then
		opts.cmd = { "clangd", "--clang-tidy", "--offset-encoding=utf-16" }
	end

	server:setup(opts)
end)
