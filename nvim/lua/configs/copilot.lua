vim.api.nvim_set_keymap("i", "<C-e>", "copilot#Accept()", {
	noremap = true,
	silent = true,
	expr = true,
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.g.copilot_filetypes = {
	["*"] = true,
}
