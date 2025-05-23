local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor",
		-- "keyvchan/virt_context.nvim",
		"stsewd/tree-sitter-comment",
		{
			"nvim-treesitter/playground",
			cmd = "TSPlaygroundToggle",
		},
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		incremental_selection = {
			enable = true,
			disable = {},
			keymaps = { -- mappings for incremental selection (visual mappings)
				init_selection = "gnn", -- maps in normal mode to init the node/scope selection
				node_incremental = "grn", -- increment to the upper named parent
				scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
				node_decremental = "grm", -- decrement to the previous node
			},
		},
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = false },
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "grr", -- mapping to rename reference under cursor
				},
			},
			navigation = {
				enable = true,
				keymaps = {
					goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
					list_definitions = "gnD", -- mapping to list all definitions in current file
				},
			},
		},
		indent = { enable = true },
		textobjects = { -- syntax-aware textobjects
			select = {
				enable = true,
				disable = {},
				keymaps = {
					-- or you use the queries from supported languages with textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["aC"] = "@class.outer",
					["iC"] = "@class.inner",
					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",
					["ae"] = "@block.outer",
					["ie"] = "@block.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["is"] = "@statement.inner",
					["as"] = "@statement.outer",
					["ad"] = "@comment.outer",
					["am"] = "@call.outer",
					["im"] = "@call.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
		-- ensure_installed = "all" -- one of "all", "language", or a list of languages
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
	})

	-- require("virt_context").setup({
	-- 	enable = true,
	-- 	position = "eol",
	-- })

	vim.o.foldmethod = "expr"
	vim.o.foldexpr = "nvim_treesitter#foldexpr()"
end

return M
