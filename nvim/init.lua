vim.loader.enable(true)
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
vim.o.updatetime = 100
vim.o.expandtab = true
vim.o.undofile = true
vim.o.smoothscroll = true
vim.o.mousemoveevent = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes:2"
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 3
vim.o.foldenable = false
vim.o.winborder = "rounded"

vim.opt.foldlevel = 99

vim.o.foldmethod = "expr"
-- Default to treesitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})

require("configs.lazy")

vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.keymap.set({ "n", "i" }, "<C-s>", function()
	vim.api.nvim_command("write!")
end, { noremap = true, silent = true })

local parsersInstalled = require("nvim-treesitter.config").get_installed("parsers")
for _, parser in pairs(parsersInstalled) do
	local filetypes = vim.treesitter.language.get_filetypes(parser)
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = filetypes,
		callback = function()
			vim.treesitter.start()
		end,
	})
end
