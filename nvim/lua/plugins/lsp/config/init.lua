local M = {
	"neovim/nvim-lspconfig",
	priority = 10000,
	event = "VeryLazy",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
	require("plugins.lsp.diagnostic").setup()
	require("plugins.lsp.config.keymap")

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover)

	local function on_attach(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
	end

	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	local servers = {
		ansiblels = {},
		bashls = {},
		clangd = {
			cmd = { "clangd", "--clang-tidy", "--offset-encoding=utf-16" },
		},
		dockerls = {},
		svelte = {},
		eslint = {},
		ltex = {},
		html = {},
		denols = {
			init_options = {
				unstable = true,
			},
		},
		jsonls = {
			settings = {
				json = {
					format = {
						enable = true,
					},
					validate = { enable = true },
				},
			},
		},
		gopls = {
			settings = {
				gopls = {
					allExperiments = true,
					staticcheck = true,
				},
			},
		},
		marksman = {},
		pyright = {
			settings = {
				python = {
					pythonPath = "/usr/local/opt/python@3.11/bin/python3.11",
				},
			},
		},
		rust_analyzer = {
			settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
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
		},
		yamlls = {},
		lua_ls = {
			single_file_support = true,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = runtime_path,
					},
					completion = {
						workspaceWord = true,
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		vimls = {},
	}

	local options = {
		on_attach = on_attach,
		capabilities = require("plugins.lsp.config.capabilities").capabilities,
	}

	for server, opts in pairs(servers) do
		opts = vim.tbl_deep_extend("force", {}, options, opts or {})
		require("lspconfig")[server].setup(opts)
	end
end

return M
