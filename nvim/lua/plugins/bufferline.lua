require("bufferline").setup({
	options = {
		indicator = {
			style = "underline",
		},
		always_show_bufferline = true,
		show_duplicate_prefix = false,
		truncate_names = false,
		offsets = {
			{
				filetype = "neo-tree",
				text = "NEO-TREE",
				highlight = "Directory",
				separator = true,
			},
		},
	},
})

vim.keymap.set({ "n", "i" }, "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", {
	noremap = true,
	silent = true,
	desc = "Cycle to next buffer",
})

vim.keymap.set("n", "<C-x>", "<Cmd>bdelete<CR>", {
	noremap = true,
	silent = true,
	desc = "Close buffer",
})
