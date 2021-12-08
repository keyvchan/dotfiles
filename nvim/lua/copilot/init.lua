vim.api.nvim_exec(
	[[
imap <silent><script><expr> <C-e> copilot#Accept()
]],
	true
)

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
