require("plugins")
require('lsp')
require('treesitter')
require('telescope-nvim')
require('icons')
-- require('statusline')
--

vim.api.nvim_set_option("termguicolors", true)
-- vim.api.nvim_set_option("softtabstop", 2)
-- vim.api.nvim_set_option("tabstop", 2)
-- vim.api.nvim_set_option("shiftwidth", 2)

vim.api.nvim_set_option("scrolloff", 5)
vim.api.nvim_set_option("splitbelow", true)
vim.api.nvim_set_option("splitright", true)
vim.api.nvim_set_option("ignorecase", true)
vim.api.nvim_set_option("conceallevel", 2)
vim.api.nvim_set_option("mouse", "a")
vim.api.nvim_set_option("wildmenu", true)
vim.api.nvim_set_option("hidden", true)
vim.api.nvim_set_option("pumheight", 10)
vim.api.nvim_set_option("cmdheight", 2)
vim.api.nvim_set_option("laststatus", 2)
vim.api.nvim_set_option("backup", false)
vim.api.nvim_set_option("updatetime", 100)
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_set_option("smartindent", true)
vim.api.nvim_command("set tabstop=2")
vim.api.nvim_command("set softtabstop=2")
vim.api.nvim_command("set shiftwidth=2")
vim.api.nvim_command("set signcolumn=yes")
vim.api.nvim_command("let mapleader=\",\"")
vim.api.nvim_command("set number")
vim.api.nvim_command("set relativenumber")

vim.api.nvim_command(
    "inoremap <expr> <Tab>   pumvisible() ? \"<C-n>\" : \"<Tab>\"")
vim.api.nvim_command(
    "inoremap <expr> <S-Tab> pumvisible() ? \"<C-p>\" : \"<S-Tab>\"")

vim.api.nvim_command("imap <silent> <c-space> <Plug>(completion_trigger)")
vim.api.nvim_command("autocmd BufEnter * lua require'completion'.on_attach()")
vim.api.nvim_command("let g:completion_trigger_on_delete = 1")
vim.api.nvim_command("set completeopt=menuone,noinsert,noselect")
vim.api.nvim_command("let g:completion_matching_ignore_case = 1")
vim.api.nvim_command("let g:completion_auto_change_source = 1")
vim.api.nvim_command("set shortmess+=c")

vim.api.nvim_command("colorscheme monokai")

-- telescope
vim.api.nvim_set_keymap('n', '<leader>ff',
                        '<CMD>lua require("telescope.builtin").find_files()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb',
                        '<CMD>lua require("telescope.builtin").buffers()<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_exec([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]], true)

-- vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")

vim.api.nvim_exec([[
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 1
call sign_define("LspDiagnosticsSignError", {"text" : "✗", "texthl" : "LspDiagnosticsVirtualTextError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : "", "texthl" : "LspDiagnosticsVirtualtextWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : "‼", "texthl" : "LspDiagnosticsVirtualtextInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : "ﯧ", "texthl" : "LspDiagnosticsVirtualTextHint"})
]], true)

vim.api.nvim_exec([[
au VimEnter * ++once lua statusline = require('statusline')
" augroup statusline_updates
"   au!
"   au BufWinEnter,WinEnter,BufEnter,BufDelete,SessionLoadPost,FileChangedShellPost * lua require('statusline').update()
" augroup END
au VimEnter * ++once lua vim.o.statusline = '%!v:lua.statusline.status()'
]], true)

-- setup diagnostic jump
vim.api.nvim_set_keymap('n', '<C-p>',
                        '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>',
                        '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>',
                        {noremap = true, silent = true})
-- Closer to the metal
vim.api.nvim_set_keymap('n', '<C-[>', '<CMD>lua require("FTerm").toggle()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-[>',
                        '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
                        {noremap = true, silent = true})
