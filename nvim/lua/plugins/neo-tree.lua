return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
	end,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = true,
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
