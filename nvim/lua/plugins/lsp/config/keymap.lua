-- rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- hover
local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function(config)
    return hover(vim.tbl_extend("force", config or {}, {
        border = "rounded",
    }))
end
