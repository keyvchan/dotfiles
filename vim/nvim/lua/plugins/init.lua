-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'
  -- use 'itchyny/lightline.vim'
  -- use {'datwaft/bubbly.nvim', config = function()
  --  -- Here you can add the configuration for the plugin
  --  vim.g.bubbly_palette = {
  --     background = "#34343c",
  --     foreground = "#c5cdd9",
  --     black = "#3e4249",
  --     red = "#ec7279",
  --     green = "#a0c980",
  --     yellow = "#deb974",
  --     blue = "#6cb6eb",
  --     purple = "#d38aea",
  --     cyan = "#5dbbc1",
  --     white = "#c5cdd9",
  --     lightgrey = "#57595e",
  --     darkgrey = "#404247",
  --  }
  -- end}
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'statusline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'jiangmiao/auto-pairs'
  use 'sbdchd/neoformat'
  use 'Yggdroot/indentLine'

  -- telescope.nvim
  -- use 'nvim-lua/popup.nvim'
  -- use 'nvim-lua/plenary.nvim'
  use {
		'nvim-lua/telescope.nvim',
		requires = {
			{
				'nvim-lua/popup.nvim'
			},
			{
				'nvim-lua/plenary.nvim'
			}
		}
  }

  -- nvim-lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  -- Plug 'nvim-lua/diagnostic-nvim'
  use 'steelsojka/completion-buffers'
  use 'nvim-lua/lsp-status.nvim'

  -- icons
  -- use 'kyazdani42/nvim-web-devicons'
  use('kyazdani42/nvim-tree.lua')

  use 'keyvchan/vim-monokai'
  use 'nvim-treesitter/nvim-treesitter'

end)
