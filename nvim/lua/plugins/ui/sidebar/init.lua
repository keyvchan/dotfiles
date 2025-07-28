return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "main",
	event = "VeryLazy",
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
		vim.keymap.set({ "n" }, "\\", function()
			require("neo-tree.command")._command("toggle")
		end, { noremap = true, silent = true })

		vim.keymap.set({ "n" }, "|", function()
			require("neo-tree.command")._command("focus")
		end, { noremap = true, silent = true })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	opts = {
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
			content_layout = "center",
			truncation_character = "…", -- character to use when truncating the tab label
		},
	},
}
