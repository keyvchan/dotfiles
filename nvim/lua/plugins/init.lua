-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup({
	function(use)
		-- Packer can manage itself as an optional plugin
		use({ "wbthomason/packer.nvim", opt = true })

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("configs.pairs")
			end,
			event = "InsertEnter",
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("configs.indent")
			end,
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{
					"nvim-lua/popup.nvim",
				},
				{
					"nvim-lua/plenary.nvim",
				},
			},
			config = function()
				require("telescope-nvim")
			end,
			after = {
				"telescope-file-browser.nvim",
				"telescope-symbols.nvim",
				"telescope-fzf-native.nvim",
				"telescope-find-pickers.nvim",
				"telescope-running-commands.nvim",
				"refactoring.nvim",
			},
		})
		use({
			"nvim-telescope/telescope-file-browser.nvim",
		})
		use({
			"nvim-telescope/telescope-symbols.nvim",
		})
		use({
			"keyvchan/telescope-find-pickers.nvim",
			branch = "nested_pickers",
		})
		use({
			"keyvchan/telescope-running-commands.nvim",
		})
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})

		use({
			"ThePrimeagen/refactoring.nvim",
			config = function()
				require("telescope-nvim.refactor")
			end,
			after = "nvim-treesitter",
		})
		use({
			"stevearc/dressing.nvim",
			config = function()
				require("configs.dressing")
			end,
			after = "telescope.nvim",
		})
		-- nvim-lsp
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("lsp")
			end,
			after = {
				"null-ls.nvim",
				"mason.nvim",
				"mason-lspconfig.nvim",
				"cmp-nvim-lsp",
			},
		})
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("lsp.status")
			end,
			after = "nvim-lspconfig",
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("lsp.null-ls")
			end,
		})
		use({
			"williamboman/mason.nvim",
			config = function()
				local mason = require("mason")
				mason.setup({
					ui = {
						keymaps = {
							apply_language_filter = "/",
						},
					},
				})
			end,
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			after = "mason.nvim",
		})
		-- dap
		use({
			"rcarriga/nvim-dap-ui",
			requires = {
				"mfussenegger/nvim-dap",
				config = function()
					require("nvim-dap")
				end,
			},
			config = function()
				require("nvim-dap.ui")
			end,
		})

		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("lsp.nvim_cmp")
			end,
		})
		use({
			"hrsh7th/cmp-nvim-lsp",
			after = { "nvim-cmp" },
		})
		use({
			"hrsh7th/cmp-buffer",
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-path",
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-cmdline",
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-nvim-lua",
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-nvim-lsp-signature-help",
			after = "nvim-cmp",
		})
		use({
			"onsails/lspkind.nvim",
		})

		use({
			"stevearc/aerial.nvim",
			config = function()
				require("lsp.outline")
			end,
			after = { "nvim-lspconfig", "nvim-treesitter" },
		})

		-- icons
		use({
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("configs.icons")
			end,
		})

		use("keyvchan/monokai.nvim")

		use("navarasu/onedark.nvim")
		use({
			"nvim-treesitter/nvim-treesitter",
			requires = {
				{
					"nvim-treesitter/nvim-treesitter-refactor",
					after = "nvim-treesitter",
				},
				{
					"nvim-treesitter/nvim-treesitter-textobjects",
					after = "nvim-treesitter",
				},
				{
					"nvim-treesitter/playground",
					after = "nvim-treesitter",
				},
				{
					"keyvchan/virt_context.nvim",
					config = function()
						require("treesitter.context")
					end,
					after = "nvim-treesitter",
				},
			},
			config = function()
				require("treesitter")
			end,
		})

		use({
			"feline-nvim/feline.nvim",
			config = function()
				require("statusline")
			end,
		})
		use({
			"github/copilot.vim",
			config = function()
				require("configs.copilot")
			end,
		})
		use({
			"nvim-neorg/neorg",
			config = function()
				require("org")
			end,
			after = { "neorg-telescope", "nvim-cmp" },
		})
		use({
			"nvim-neorg/neorg-telescope",
			after = "telescope.nvim",
		})

		use({
			"rcarriga/nvim-notify",
			config = function()
				require("configs.nvim-notify")
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("configs.git")
			end,
		})
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("configs.tree")
			end,
		})
	end,

	config = { display = { open_fn = require("packer.util").float } },
})
