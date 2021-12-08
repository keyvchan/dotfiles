-- diagnostic
vim.api.nvim_set_keymap(
	"n",
	"<C-p>",
	"<CMD>lua vim.diagnostic.goto_prev{float = {show_header = true}}<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	"<CMD>lua vim.diagnostic.goto_next{float = {show_header = true}}<CR>",
	{ noremap = true, silent = true }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
