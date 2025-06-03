vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.lsp.enable({ "gopls", "clangd", "luals", "rust-analyzer" })

vim.lsp.inlay_hint.enable(true)
