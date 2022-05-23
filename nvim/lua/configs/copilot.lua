vim.keymap.set("i", "<C-e>", "copilot#Accept()", {
  silent = true,
  expr = true,
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.g.copilot_filetypes = {
  ["*"] = true,
}

vim.g.copilot_node_command = "/usr/local/opt/node@16/bin/node"
