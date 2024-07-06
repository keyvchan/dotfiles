local M = {
	"Exafunction/codeium.vim",
	event = "VeryLazy",
}

function M.init()
	vim.g.codeium_no_map_tab = true
end

function M.config()
	vim.keymap.set("i", "<C-e>", "codeium#Accept()", {
		silent = true,
		expr = true,
		replace_keycodes = false,
	})

	vim.g.codeium_filetypes = {
		["*"] = true,
	}
end

return M
