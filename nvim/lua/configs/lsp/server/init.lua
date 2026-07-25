vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.config("sourcekit", {
	filetypes = { "swift" },
})

vim.lsp.enable({ "gopls", "clangd", "lua_ls", "rust_analyzer", "sourcekit", "ty" })

require("configs.lsp.server.lua_ls")
