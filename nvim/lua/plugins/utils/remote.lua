local M = {
	"chipsenkbeil/distant.nvim",
	-- branch = "v0.3",
	branch = "v0.2",
	event = "VeryLazy",
}

M.config = function()
	-- require("distant").setup({})
	require("distant").setup({
		["*"] = require("distant.settings").chip_default(),
	})
end

return M
