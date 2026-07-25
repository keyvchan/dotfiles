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
	"https://github.com/saghen/blink.indent",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/chenkeyv/acp.nvim",
	"https://github.com/luukvbaal/statuscol.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/kawre/leetcode.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/Bekaboo/dropbar.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/chrisgrieser/nvim-origami",
	"https://github.com/lewis6991/satellite.nvim",
	"https://github.com/NMAC427/guess-indent.nvim",
	"https://github.com/stevearc/conform.nvim",
})

vim.api.nvim_create_user_command("PackSync", function()
	local stale = {}
	for _, plugin in ipairs(vim.pack.get(nil, { info = false })) do
		if not plugin.active then
			stale[#stale + 1] = plugin.spec.name
		end
	end

	if #stale == 0 then
		vim.notify("Plugins are already synchronized")
		return
	end

	vim.pack.del(stale)
end, { desc = "Remove plugins no longer declared in the configuration" })

require("plugins.colorscheme")
require("plugins.statusline")
require("plugins.git")
require("plugins.pairs")
require("plugins.fold")
require("plugins.scrollbar")
require("plugins.indent")

require("plugins.treesitter")
require("plugins.snacks")
require("plugins.leetcode")
require("plugins.statuscolumn")
require("plugins.blink")
require("plugins.notify")
require("plugins.dropbar")
require("plugins.neotree")
require("plugins.format")
