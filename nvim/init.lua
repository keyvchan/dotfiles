vim.loader.enable()
vim.g.mapleader = ","
vim.o.termguicolors = true
vim.o.scrolloff = 5
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.conceallevel = 2
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.cmdheight = 0
vim.o.updatetime = 250
vim.o.expandtab = true
vim.o.undofile = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.signcolumn = "yes:2"
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 3
vim.o.foldenable = false

require("configs.lazy")

vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.keymap.set({ "n", "i" }, "<C-s>", function()
	vim.api.nvim_command("write!")
end, { noremap = true, silent = true })
