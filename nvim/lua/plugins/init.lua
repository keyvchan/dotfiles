-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup({
	function(use)
		-- Packer can manage itself as an optional plugin
		use({ "wbthomason/packer.nvim", opt = true })

		-- -- use "jiangmiao/auto-pairs"
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("pairs")
			end,
		})
		use("sbdchd/neoformat")
		-- -- use("Yggdroot/indentLine")
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent")
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
				{
					"nvim-telescope/telescope-file-browser.nvim",
				},
				{
					"nvim-telescope/telescope-symbols.nvim",
				},
			},
			config = function()
				require("telescope-nvim")
			end,
		})

		-- -- nvim-lsp
		use({
			"neovim/nvim-lspconfig",
			requires = {
				{
					"onsails/lspkind-nvim",
					config = function()
						require("lsp-kind")
					end,
				},
				"ray-x/lsp_signature.nvim",
				"nvim-lua/lsp-status.nvim",
				{
					"hrsh7th/nvim-cmp",
					requires = {
						{
							"hrsh7th/cmp-nvim-lsp",
						},
						{
							"hrsh7th/cmp-buffer",
						},
						{
							"hrsh7th/cmp-path",
						},
						{
							"hrsh7th/cmp-cmdline",
						},
						{
							"hrsh7th/cmp-copilot",
						},
						{
							"hrsh7th/cmp-nvim-lua",
						},
					},
				},
			},
			config = function()
				require("lsp")
			end,
		}) -- -- use("hrsh7th/nvim-compe")

		-- icons
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("icons")
			end,
		})

		use("keyvchan/vim-monokai")
		use({
			"nvim-treesitter/nvim-treesitter",
			requires = {
				"nvim-treesitter/nvim-treesitter-refactor",
				"nvim-treesitter/nvim-treesitter-textobjects",
				"nvim-treesitter/playground",
			},
			config = function()
				require("treesitter")
			end,
		})
		-- use { "numtostr/FTerm.nvim" }

		use({
			"glepnir/galaxyline.nvim",
			branch = "main",
			config = function()
				require("statusline")
			end,
		})

		-- -- use "karb94/neoscroll.nvim"
		use({
			"github/copilot.vim",
			config = function()
				require("copilot")
			end,
		})
		use({
			"nvim-neorg/neorg",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-neorg/neorg-telescope",
			},
			config = function()
				require("org")
			end,
		})
	end,
	config = { display = { open_fn = require("packer.util").float } },
})
