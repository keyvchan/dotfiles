vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	'<CMD>lua require("telescope.builtin").find_files()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	'<CMD>lua require("telescope.builtin").buffers()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"lg",
	'<CMD>lua require("telescope.builtin").live_grep()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>qf",
	'<CMD>lua require("telescope.builtin").quickfix()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ca",
	'<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gd",
	'<cmd>lua require("telescope.builtin").lsp_definitions()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gi",
	'<CMD>lua require("telescope.builtin").lsp_implementations()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gtd", '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap(
	"n",
	"gr",
	'<cmd>lua require("telescope.builtin").lsp_references()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "gds", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', {
	noremap = true,
	silent = true,
})
vim.api.nvim_set_keymap("n", "gws", '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', {
	noremap = true,
	silent = true,
})

vim.api.nvim_set_keymap("n", "<leader><leader>", '<cmd>lua require("telescope.builtin").builtin()<CR>', {
	noremap = true,
	silent = true,
})
