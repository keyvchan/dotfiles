local M = {
	"github/copilot.vim",
	event = "VeryLazy",
}

function M.init()
	-- must source the global variable before loading the plugin
	vim.g.copilot_no_tab_map = true
	vim.g.copilot_assume_mapped = true
end

function M.config()
	vim.keymap.set("i", "<C-e>", "copilot#Accept()", {
		silent = true,
		expr = true,
		replace_keycodes = false,
	})

	vim.g.copilot_filetypes = {
		["*"] = true,
	}
end

return M
