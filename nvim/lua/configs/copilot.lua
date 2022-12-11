vim.keymap.set("i", "<C-e>", "copilot#Accept()", {
	silent = true,
	expr = true,
	replace_keycodes = false,
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.g.copilot_filetypes = {
	["*"] = true,
}
