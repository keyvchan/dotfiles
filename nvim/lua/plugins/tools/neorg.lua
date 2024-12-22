return {
	"nvim-neorg/neorg",
	opts = {},
	ft = "norg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
			},
		})
	end,
}
