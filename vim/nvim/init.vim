"						Coniguration for MacOS vim/nvim keyvchan@gmail.com
"									last update 2019/10/23

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'Yggdroot/indentLine'

" telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" nvim-lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-lua/lsp-status.nvim'

" icons
Plug 'kyazdani42/nvim-web-devicons'

Plug 'keyvchan/vim-monokai'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile '}

" Initialize plugin system
call plug#end()

" Setting for tmux
if exists('$TMUX')
	set term=screen-256color
endif

" vim native setting
syntax on
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4
set scrolloff=5
set splitbelow splitright
set relativenumber "display relativenumber
set ignorecase
let mapleader=","
set noshowmode
set conceallevel=2

" set mouse clicked as 'a'
set noexpandtab
set mouse=a
set backspace=2
set path+=**
set wildmenu
set termguicolors
set guicursor=
set hidden
let g:netrw_banner = 0
filetype plugin on

" limit cpmplete height
set pumheight=10

" Disable paren match
function! g:FuckThatMatchParen ()
	if exists(":NoMatchParen")
		:NoMatchParen
	endif
endfunction

augroup plugin_initialize
	autocmd!
	autocmd VimEnter * call FuckThatMatchParen()
augroup END


set cmdheight=2
set laststatus=2

" fix paste intend
set nopaste

set t_Co=256
colorscheme monokai

" set vim language to avoid encoding error.
set langmenu=en_US
set encoding=utf-8
let $LANG = 'en_US'

" Neoformat
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" 
set showtabline=2

let g:lightline = {
		\ 'colorscheme': 'one',
		\ 'active': {
		\   'left': [ [ 'mode', 'paste' ],
		\             [ 'path', 'filename',  'modified', 'cocstatus', 'currentfunction', 'readonly',  ]
		\   ],
		\   'right': [
		\				['lineinfo'],
		\				['percent'],
		\				['filetype', 'fileformat', 'lsp_status']
		\ 
		\	]
		\ },
		\ 'component_function': {
		\	  'devicons_filetype': 'WebDevIconsGetFileTypeSymbol',
		\	  'devicons_fileformat': 'WebDevIconsGetFileFormatSymbol',
		\	  'cocstatus': 'coc#status',
		\	  'path': 'LightLineFilename'
		\ },
		\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
		\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
		\ }

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
            \ 'right': [ ['myCurrentDir'],
            \            [ 'gitstatus' ] ]
            \ }

let g:lightline.component = {
            \ 'myCurrentDir': ' %{fnamemodify(getcwd(), ":t")}',
            \ 'currentFunc': '%{CocCurrentFunction()}',
            \ 'currentFunc2': '%{TreeSitterCurrentElement()}',
            \ 'obsession': '%{ObsessionStatusEnhance()}',
            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
            \ 'vim_logo': "\ue7c5",
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'percent': '%2p%%',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%3l:%-2v',
            \ 'line': '%l',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}'
            \ }

function! LightLineFilename()
	return expand('%:p:h')
endfunction

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

let g:lightline.component_expand = {
            \ 'lsp_status': 'LspStatus'
            \ }

let g:lightline.component_visible_condition = {
            \ 'lsp_status': 'luaeval("#vim.lsp.buf_get_clients() > 0")',
            \}
" Set middle of status line  to transprant
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE'  ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
call insert(s:palette.normal.right, s:palette.normal.left[1], 0)

autocmd CursorMoved call lightline#update()
" 

" " =============================================================================
let g:indentLine_enabled=1
let g:indentLine_concealcursor=""

lua <<EOF
require('lsp')
require('treesitter')
require('telescope1')
require('icons')

EOF

"nvim-lsp
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_trigger_on_delete = 1

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>

" diagnostic
let g:diagnostic_enable_virtual_text = 1
call sign_define("LspDiagnosticsErrorSign", {"text" : "✗", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "‼", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "ﯧ", "texthl" : "LspDiagnosticsHint"})


