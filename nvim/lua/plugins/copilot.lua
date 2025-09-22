vim.g.codeium_no_map_tab = true

vim.keymap.set("i", "<C-e>", "codeium#Accept()", {
	silent = true,
	expr = true,
	replace_keycodes = false,
})

vim.g.codeium_filetypes = {
	["*"] = true,
}
