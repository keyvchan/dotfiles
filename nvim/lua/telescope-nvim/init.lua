require("telescope").setup({
	defaults = {
		color_devicons = true,
		prompt_prefix = "🔍 ",
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
	},
	pickers = {
		-- lsp stuff
		lsp_references = {
			theme = "cursor",
		},
		lsp_document_symbols = {
			theme = "cursor",
		},
		lsp_workspace_symbols = {
			theme = "ivy",
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
		fzy_native = {
			override_generic_picker = true,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("find_pickers")
--

require("telescope").setup()
require("telescope-nvim.keymap")
