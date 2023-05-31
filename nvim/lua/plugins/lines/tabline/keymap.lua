-- set keymap
vim.keymap.set({ "n", "i" }, "<C-Tab>", function()
	require("bufferline.commands").cycle(1)
end)
