local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",

	dependencies = {
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-symbols.nvim" },
		{ "keyvchan/telescope-find-pickers.nvim", branch = "nested_pickers" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}

function M.config()
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
	-- require("telescope").load_extension("refactoring")
end

function M.init()
	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", builtin.find_files)
	vim.keymap.set("n", "<leader>fg", builtin.git_files)
	vim.keymap.set("n", "<leader>lg", builtin.live_grep)

	-- lsp stuff
	vim.keymap.set("n", "<leader>qf", builtin.quickfix)
	vim.keymap.set("n", "<leader>lca", require("vim.lsp.buf").code_action)
	vim.keymap.set("n", "gd", builtin.lsp_definitions)
	vim.keymap.set("n", "gi", builtin.lsp_implementations)
	vim.keymap.set("n", "td", builtin.lsp_type_definitions)
	vim.keymap.set("n", "gr", builtin.lsp_references)

	-- extensions
	vim.keymap.set("n", "<leader><leader>", require("telescope").extensions.find_pickers.find_pickers)
	vim.keymap.set("n", "<leader>fb", require("telescope").extensions.file_browser.file_browser)
end

return M
