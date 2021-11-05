require("plugins")
require("lsp")
require("treesitter")
require("telescope-nvim")
require("icons")
require("statusline")
require("lsp-kind")
require("ui")
require("pairs")

-- vim.api.nvim_set_option("termguicolors", true)
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
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.completeopt = "menu,preview,noinsert"
vim.opt.completeopt = "menu,menuone,noselect"

vim.api.nvim_command("colorscheme monokai")
vim.api.nvim_command("set nospell")

vim.g.mapleader = ","
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

-- telescope
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	'<CMD>lua require("telescope.builtin").find_files()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	'<CMD>lua require("telescope.builtin").buffers()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>bb",
	'<CMD>lua require("telescope.builtin").file_browser()<CR>',
	{ noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap('n', '<leader>fb',
--                         '<CMD>lua require("telescope.builtin").buffers()<CR>',
--                         {noremap = true, silent = true})

vim.api.nvim_exec(
	[[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]],
	true
)

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_enable_underline = 1

vim.fn.sign_define("LspDiagnosticsSignError", { text = "✗", texthl = "LspDiagnosticsVirtualTextError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsVirtualtextWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "‼", texthl = "LspDiagnosticsVirtualtextInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "ﯧ", texthl = "LspDiagnosticsVirtualTextHint" })

vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticVirtualTextError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticVirtualtextWarning" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "‼", texthl = "DiagnosticVirtualtextInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "ﯧ", texthl = "DiagnosticVirtualTextHint" })

-- setup diagnostic jump
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

-- treesitter
-- vim.api.foldmethod = "expr"
-- vim.api.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.api.nvim_command "set foldmethod=expr"
-- vim.api.nvim_command "set foldexpr=nvim_treesitter#foldexpr()"
