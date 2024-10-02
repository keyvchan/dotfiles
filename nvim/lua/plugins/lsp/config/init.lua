local M = {
	"neovim/nvim-lspconfig",
	-- lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

local function on_attach(client, bufnr)
	-- vim.lsp.inlay_hint(bufnr, true)
	require("plugins.lsp.config.keymap")
	require("plugins.lsp.diagnostic").setup()
end

function M.config()
	-- inlay_hints
	-- require("plugins.lsp.inlay_hints")

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
					hint = {
						enable = true,
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
