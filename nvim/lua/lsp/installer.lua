local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "\u{fb3c}",
			server_pending = "\u{fb3c}",
			server_uninstalled = "\u{fb3c}",
		},
	},
})

lsp_installer.on_server_ready(function(server)
	local opts = {}

	opts.capilities = require("lsp.capabilities").capabilities
	opts.on_attach = require("lsp.capabilities").on_attach

	if server.name == "sumneko_lua" then
		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")
		opts.settings = {
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
		}
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
		opts.filetypes = { "swift" }
	end

	if server.name == "clangd" then
		opts.cmd = { "clangd", "--clang-tidy", "--offset-encoding=utf-16" }
	end

	if server.name == "gopls" then
		opts.init_options = {
			usePlaceholders = false,
		}
		opts.settings = {
			gopls = {
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		}
	end

	server:setup(opts)
end)
