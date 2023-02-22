return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.norg.concealer"] = {},
				["core.norg.dirman"] = {
					config = {
						workspaces = {
							learning = "/Users/keyv/Documents/learning",
							memo = "/Users/keyv/Documents/memo",
							leetcode = "/Users/keyv/Codebases/GolandProjects/leetcode",
						},
					},
				},
				["core.norg.completion"] = {
					config = { engine = "nvim-cmp" },
				},
				["core.integrations.nvim-cmp"] = {},
				["core.export"] = {},
				["core.integrations.telescope"] = {},
			},
		})
	end,
	dependencies = {
		"nvim-neorg/neorg-telescope",
	},
}
