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
		dynamic_preview_window = true,
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
})
require("telescope").load_extension("file_browser")
require("telescope-nvim.keymap")
