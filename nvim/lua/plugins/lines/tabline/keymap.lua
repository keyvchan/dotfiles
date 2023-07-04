-- cycle through buffers
vim.keymap.set({ "n", "i" }, "<C-Tab>", function()
	require("bufferline.commands").cycle(1)
end)

-- close the tab
vim.keymap.set({ "n" }, "<C-x>", function()
	vim.cmd("bdelete")
end)
