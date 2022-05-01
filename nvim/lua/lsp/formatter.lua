local group = vim.api.nvim_create_augroup("fmt", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if vim.bo.filetype == "norg" then
      -- if filetype is norg, use indent
      vim.api.nvim_feedkeys("gg=G``", "n", true)
    end
    vim.lsp.buf.format({ timeout_ms = 4000 })
  end,
  group = group,
})
