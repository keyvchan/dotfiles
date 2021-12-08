require("neorg").setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader>o",
			},
		},
		["core.norg.concealer"] = {}, -- Allows for use of icons
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		}, -- Allows for use of completion
		["core.norg.dirman"] = {
			config = {
				workspace = "~/Workspace/org",
				learning = "~/Documents/learning",
			},
		},
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
