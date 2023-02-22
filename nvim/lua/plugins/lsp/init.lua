local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
	require("plugins.lsp.diagnostics").setup()
	require("plugins.lsp.keymap")
	require("plugins.lsp.formatter")

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
			cmd = { "clangd", "--clang-tidy" },
		},
		dockerls = {},
		tsserver = {},
		svelte = {},
		eslint = {},
		html = {},
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
		capabilities = require("plugins.lsp.capabilities").capabilities,
	}

	for server, opts in pairs(servers) do
		opts = vim.tbl_deep_extend("force", {}, options, opts or {})
		require("lspconfig")[server].setup(opts)
	end

	require("plugins.null-ls").setup(options)
end

return M
