local neorg = require("neorg")
neorg.setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader>o",
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
	},
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}

parser_configs.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}
