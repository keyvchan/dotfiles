vim.keymap.set({ "n" }, "<leader>lca", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Code action" })

-- diagnostic keymap
vim.keymap.set("n", "<C-p>", function()
	vim.diagnostic.jump({
		count = -1,
		float = {
			show_header = true,
		},
	})
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "<C-n>", function()
	vim.diagnostic.jump({
		count = 1,
		float = { show_header = true },
	})
end, { desc = "Next diagnostic" })
