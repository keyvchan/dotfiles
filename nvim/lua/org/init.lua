local neorg = require("neorg")
neorg.setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<leader>o",
			},
		},
		["core.norg.concealer"] = {
			config = {
				icon_preset = "diamond",
			},
		}, -- Allows for use of icons
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		}, -- Allows for use of completion
		["core.norg.qol.toc"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					my_workspace = "~/Workspace/org",
					learning = "~/Documents/learning",
					journal = "~/Documents/journal",
					gtd = "~/Workspace/gtd",
					leetcode = "~/Codebases/GolandProjects/leetcode",
				},
				-- autochdir = false,
			},
		},
		["core.norg.journal"] = {
			config = {
				workspace = "journal",
				use_folder = true,
			},
		},
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
				displayers = {
					projects = {
						show_completed_projects = true,
						show_projects_without_tasks = false,
					},
				},
			},
		},
		["core.gtd.ui"] = {},
		["core.integrations.telescope"] = {},
		["core.queries.native"] = {},
		["external.context"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {
			--   config = {
			--     extensions = "todo-items-basic",
			--   },
		},
	},
})
