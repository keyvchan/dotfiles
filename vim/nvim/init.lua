require "plugins"
require "lsp"
require "treesitter"
require "telescope-nvim"
require "icons"
require "statusline"
require "lsp-kind"
require "scroll"
require "ui"

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
vim.opt.smartindent = true
vim.opt.spell = false
vim.opt.pumblend = 30
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = "menu,preview,noinsert"

vim.api.nvim_command "colorscheme monokai"

-- vim.api.nvim_command "set number"
-- vim.api.nvim_command "set relativenumber"
-- vim.api.nvim_command "set completeopt=menu,preview,noinsert"
-- vim.api.nvim_set_option("scrolloff", 5)
-- vim.api.nvim_set_option("splitbelow", true)
-- vim.api.nvim_set_option("splitright", true)
-- vim.api.nvim_set_option("ignorecase", true)
-- vim.api.nvim_set_option("conceallevel", 2)
-- vim.api.nvim_set_option("mouse", "a")
-- vim.api.nvim_set_option("wildmenu", true)
-- vim.api.nvim_set_option("hidden", true)
-- vim.api.nvim_set_option("pumheight", 10)
-- vim.api.nvim_set_option("cmdheight", 2)
-- vim.api.nvim_set_option("laststatus", 2)
-- vim.api.nvim_set_option("backup", false)
-- vim.api.nvim_set_option("updatetime", 100)
-- vim.api.nvim_set_option("expandtab", true)
-- vim.api.nvim_set_option("smartindent", true)
-- vim.api.nvim_set_option("spell", false)
-- vim.api.nvim_set_option("pumblend", 30)
-- vim.api.nvim_command "set tabstop=2"
-- vim.api.nvim_command "set softtabstop=2"
-- vim.api.nvim_command "set shiftwidth=2"
-- vim.api.nvim_command "set signcolumn=yes"
vim.g.mapleader = ","
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
-- vim.api.nvim_command 'let mapleader=","'
-- vim.api.nvim_command "let g:loaded_ruby_provider=0"
-- vim.api.nvim_command "let g:loaded_node_provider=0"
-- vim.api.nvim_command "let g:loaded_python_provider=0"
-- vim.api.nvim_command "let g:loaded_python3_provider=0"
-- vim.api.nvim_command "let g:loaded_perl_provider=0"

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

-- vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_enable_underline = 1

vim.api.nvim_exec(
  [[
call sign_define("LspDiagnosticsSignError", {"text" : "✗", "texthl" : "LspDiagnosticsVirtualTextError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : "", "texthl" : "LspDiagnosticsVirtualtextWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : "‼", "texthl" : "LspDiagnosticsVirtualtextInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : "ﯧ", "texthl" : "LspDiagnosticsVirtualTextHint"})
]],
  true
)

-- setup diagnostic jump
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
-- Closer to the metal
vim.api.nvim_set_keymap("n", "<C-[>", '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "t",
  "<C-[>",
  '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
  { noremap = true, silent = true }
)

-- treesitter
-- vim.api.foldmethod = "expr"
-- vim.api.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.api.nvim_command "set foldmethod=expr"
-- vim.api.nvim_command "set foldexpr=nvim_treesitter#foldexpr()"
