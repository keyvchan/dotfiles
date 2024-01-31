local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
}

function M.config()
	require("ibl").setup({
		exclude = {
			buftypes = {
				"terminal",
				"nofile",
			},
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"neo-tree",
				"Trouble",
			},
		},
		indent = {
			char = "│",
		},
	})
end

return M
