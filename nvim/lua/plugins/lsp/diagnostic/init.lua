local M = {}

M.signs = { Error = "✗ ", Warn = " ", Hint = "ﯧ ", Info = " " }

function M.setup()
	-- diagnostic keymap
	vim.keymap.set("n", "<C-p>", function()
		vim.diagnostic.goto_prev({ float = { show_header = true } })
	end)
	vim.keymap.set("n", "<C-n>", function()
		vim.diagnostic.goto_next({ float = { show_header = true } })
	end)

	-- Automatically update diagnostics
	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		virtual_text = { spacing = 4, source = "always" },
		severity_sort = true,
	})

	for type, icon in pairs(M.signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return M
