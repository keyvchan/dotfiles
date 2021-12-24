local neogit = require("neogit")

neogit.setup({
	kind = "floating",
})

vim.api.nvim_set_keymap(
	"n",
	"<leader>g",
	"<CMD>lua require('neogit').open({kind = 'floating'})<CR>",
	{ noremap = true, silent = true }
)
