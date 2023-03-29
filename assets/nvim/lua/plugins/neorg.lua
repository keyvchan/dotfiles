return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.norg.journal"] = {
					config = {
						workspace = "journal",
					},
				},
				["core.norg.concealer"] = {},
				["core.norg.dirman"] = {
					config = {
						workspaces = {
							learning = "/Users/keyv/Documents/learning",
							memo = "/Users/keyv/Documents/memo",
							leetcode = "/Users/keyv/Codebases/GolandProjects/leetcode",
							journal = "/Users/keyv/Documents/journal",
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
