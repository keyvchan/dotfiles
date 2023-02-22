return {
	"windwp/nvim-autopairs",
	event = "VeryLazy",

	config = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({
			check_ts = true,
		})
	end,
}
