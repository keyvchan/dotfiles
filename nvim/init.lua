vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.conceallevel = 2
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.cmdheight = 2
vim.opt.backup = false
vim.opt.updatetime = 250
vim.opt.expandtab = true
vim.opt.pumblend = 30
vim.opt.winblend = 0
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ","
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.do_filetype_lua = 1

require("plugins")
vim.api.nvim_command("colorscheme monokai")
