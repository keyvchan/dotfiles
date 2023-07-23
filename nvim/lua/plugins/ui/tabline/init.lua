local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "UIEnter",
}

function M.config()
	-- always show tabline
	require("bufferline").setup({
		options = {
			indicator = {
				style = "underline",
			},
			always_show_bufferline = true,
			name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
				return buf.name
			end,
			show_duplicate_prefix = false,
			truncate_names = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "NEO-TREE",
					highlight = "Directory",
					separator = true, -- use a "true" to enable the default, or set your own character
				},
			},
		},
	})

	require("plugins.ui.tabline.keymap")
end

return M
