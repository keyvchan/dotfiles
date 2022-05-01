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
			event = { "InsertEnter" },
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("configs.indent")
			end,
			event = { "VimEnter" },
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
				{
					"nvim-telescope/telescope-file-browser.nvim",
					event = "VimEnter",
				},
				{
					"nvim-telescope/telescope-symbols.nvim",
					event = "VimEnter",
				},
				{
					"keyvchan/telescope-find-pickers.nvim",
					event = "VimEnter",
				},
				{
					"keyvchan/telescope-running-commands.nvim",
					event = "VimEnter",
				},
				{
					"nvim-telescope/telescope-fzy-native.nvim",
					event = "VimEnter",
				},
			},
			config = function()
				require("telescope-nvim")
			end,
			after = {
				"telescope-fzy-native.nvim",
				"telescope-file-browser.nvim",
				"telescope-symbols.nvim",
				"telescope-find-pickers.nvim",
				"telescope-running-commands.nvim",
				"refactoring.nvim",
			},
		})
		use({
			"ThePrimeagen/refactoring.nvim",
			after = {
				"nvim-treesitter",
			},
			config = function()
				require("telescope-nvim.refactor")
			end,
		})
		use({
			"stevearc/dressing.nvim",
			after = {
				"telescope.nvim",
			},
			config = function()
				require("configs.dressing")
			end,
		})
		-- nvim-lsp
		use({
			"neovim/nvim-lspconfig",
			requires = {
				{
					"j-hui/fidget.nvim",
					config = function()
						require("lsp.status")
					end,
					event = "VimEnter",
				},
				{
					"jose-elias-alvarez/null-ls.nvim",
					config = function()
						require("lsp.null-ls")
					end,
					event = "VimEnter",
				},
				{
					"williamboman/nvim-lsp-installer",
					config = function()
						require("lsp.installer")
					end,
					event = "VimEnter",
				},
			},
			config = function()
				require("lsp")
			end,
		})

		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{
					"hrsh7th/cmp-nvim-lsp",
				},
				{
					"hrsh7th/cmp-buffer",
					after = "nvim-cmp",
				},
				{
					"hrsh7th/cmp-path",
					after = "nvim-cmp",
				},
				{
					"hrsh7th/cmp-cmdline",
					after = "nvim-cmp",
				},
				{
					"hrsh7th/cmp-nvim-lua",
					after = "nvim-cmp",
				},
				{
					"hrsh7th/cmp-nvim-lsp-signature-help",
					after = "nvim-cmp",
				},
				{
					"onsails/lspkind.nvim",
					event = { "VimEnter" },
				},
			},
			config = function()
				require("lsp.nvim_cmp")
			end,
			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
		})

		-- icons
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("configs.icons")
			end,
		})

		use("keyvchan/monokai.nvim")
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
					after = "nvim-treesitter",
					config = function()
						require("treesitter.context")
					end,
				},
			},
			config = function()
				require("treesitter")
			end,
			event = "VimEnter",
		})

		use({
			"feline-nvim/feline.nvim",
			branch = "develop",
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
      ft = "norg",
			requires = {
				{
					"nvim-neorg/neorg-telescope",
					-- after = "telescope.nvim",
				},
			},
			config = function()
				require("org")
			end,
			after = {
				"nvim-treesitter",
				"nvim-cmp",
				"telescope.nvim",
			},
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
			event = "VimEnter",
		})
	end,

	config = { display = { open_fn = require("packer.util").float } },
})
