return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.journal"] = {
					config = {
						workspace = "journal",
					},
				},
				["core.concealer"] = {
					config = {
						dim_code_blocks = {
							enabled = false,
						},
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							learning = "/Users/keyv/Documents/learning",
							memo = "/Users/keyv/Documents/memo",
							leetcode = "/Users/keyv/Codebases/GolandProjects/leetcode",
							journal = "/Users/keyv/Documents/journal",
						},
					},
				},
				["core.completion"] = {
					config = { engine = "nvim-cmp" },
				},
				["core.integrations.nvim-cmp"] = {},
				["core.export"] = {},
				["core.integrations.telescope"] = {},
				["core.summary"] = {},
			},
		})
	end,
	dependencies = {
		"nvim-neorg/neorg-telescope",
	},
}
