vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = "main",
	},
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("*"),
	},
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rebelot/heirline.nvim",
	"https://github.com/linrongbin16/lsp-progress.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/Exafunction/windsurf.vim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/Bekaboo/dropbar.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/chrisgrieser/nvim-origami",
	"https://github.com/lewis6991/satellite.nvim",
})

require("plugins.colorscheme")
require("plugins.statusline")
require("plugins.copilot")
require("plugins.git")
require("plugins.pairs")
require("plugins.fold")
require("plugins.scrollbar")

require("plugins.treesitter")
require("plugins.snacks")
require("plugins.blink")
require("plugins.nonels")
require("plugins.noice")
require("plugins.notify")
require("plugins.dropbar")
require("plugins.neotree")
