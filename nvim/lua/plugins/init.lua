-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup({
	function(use)
		-- Packer can manage itself as an optional plugin
		use({ "wbthomason/packer.nvim", opt = true })

		-- use "jiangmiao/auto-pairs"
		use("windwp/nvim-autopairs")
		use("sbdchd/neoformat")
		use("Yggdroot/indentLine")

		use({
			"nvim-lua/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		})

		-- nvim-lsp
		use("neovim/nvim-lspconfig")
		-- use("hrsh7th/nvim-compe")

		use({
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
			},
		})

		use("nvim-lua/lsp-status.nvim")

		-- icons
		use("kyazdani42/nvim-web-devicons")

		use("keyvchan/vim-monokai")
		use("nvim-treesitter/nvim-treesitter")
		use("nvim-treesitter/playground")
		-- use { "numtostr/FTerm.nvim" }

		use("mjlbach/neovim-ui")

		use({
			"glepnir/galaxyline.nvim",
			branch = "main",
		})
		use({
			"onsails/lspkind-nvim",
		})

		-- use "karb94/neoscroll.nvim"
		use({
			"ray-x/lsp_signature.nvim",
		})
	end,
	config = { display = { open_fn = require("packer.util").float } },
})
