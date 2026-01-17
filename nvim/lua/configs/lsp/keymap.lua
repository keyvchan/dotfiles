vim.keymap.set({ "n" }, "<leader>lca", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true })

-- diagnostic keymap
vim.keymap.set("n", "<C-p>", function()
	vim.diagnostic.jump({
		count = -1,
		float = {
			show_header = true,
		},
	})
end)

vim.keymap.set("n", "<C-n>", function()
	vim.diagnostic.jump({
		count = 1,
		float = { show_header = true },
	})
end)
