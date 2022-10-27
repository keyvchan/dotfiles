require("telescope").setup({
	defaults = {
		color_devicons = true,
		prompt_prefix = "   ",
		file_ignore_patterns = {
			-- git
			".git/.*",
			-- rust
			"target/.*",
		},
		-- path_display = {
		-- 	"shorten",
		-- },
		-- dynamic_preview_window = true,
		initial_mode = "insert",
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
		-- lsp stuff
		lsp_references = {
			theme = "cursor",
		},
		lsp_document_symbols = {
			theme = "dropdown",
		},
		lsp_workspace_symbols = {
			theme = "dropdown",
		},
		lsp_dynamic_workspace_symbols = {
			theme = "ivy",
		},
		lsp_code_actions = {
			theme = "cursor",
		},
		lsp_range_code_actions = {
			theme = "cursor",
		},
		lsp_document_diagnostics = {
			theme = "ivy",
		},
		lsp_workspace_diagnostics = {
			theme = "ivy",
		},
		lsp_implementations = {
			theme = "cursor",
		},
		lsp_definitions = {
			theme = "cursor",
		},
		lsp_type_definitions = {
			theme = "cursor",
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
})

require("telescope").load_extension("find_pickers")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
require("telescope").load_extension("running_commands")
require("telescope").load_extension("refactoring")

require("telescope-nvim.keymap")
