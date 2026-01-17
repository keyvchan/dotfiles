vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.enable({ "gopls", "clangd", "lua_ls", "rust-analyzer", "sourcekit" })

require("configs.lsp.server.lua_ls")
