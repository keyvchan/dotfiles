vim.opt.termguicolors = true
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.conceallevel = 2
vim.opt.mouse = "a"
vim.opt.wildmenu = true
vim.opt.hidden = true
vim.opt.pumheight = 10
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.updatetime = 100
vim.opt.expandtab = true
-- vim.opt.smartindent = true
vim.opt.pumblend = 30
-- vim.opt.winblend = 30
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_command("colorscheme monokai")
vim.api.nvim_command("set nospell")

vim.g.mapleader = ","
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

-- telescope

vim.api.nvim_exec(
	[[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]],
	true
)

-- treesitter
-- vim.api.foldmethod = "expr"
-- vim.api.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.api.nvim_command "set foldmethod=expr"
-- vim.api.nvim_command "set foldexpr=nvim_treesitter#foldexpr()"

require("plugins")
require("floatline")
