return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "main",
	event = "VeryLazy",
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
	end,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},
			hijack_netrw_behavior = "open_default",
			source_selector = {
				winbar = true,
			},
		})
		vim.keymap.set({ "n", "i" }, "<M-b>", function()
			require("neo-tree.command")._command("toggle")
		end, { noremap = true, silent = true })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
