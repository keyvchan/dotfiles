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
				markup_preset = "dimmed",
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

parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}
