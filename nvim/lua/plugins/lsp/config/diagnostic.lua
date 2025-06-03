local M = {}

M.signs = { Error = "✗ ", Warn = " ", Hint = "ﯧ ", Info = " " }

function M.setup()
	-- diagnostic keymap
	vim.keymap.set("n", "<C-p>", function()
		vim.diagnostic.jump({
			count = -1,
			float = {
				show_header = true,
			},
		})
	end)
	vim.keymap.set("n", "<C-n>", function()
		vim.diagnostic.jump({
			count = 1,
			float = { show_header = true },
		})
	end)

	-- Automatically update diagnostics
	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		virtual_text = {
			virt_text_pos = "eol_right_align",
			spacing = 4,
			source = "if_many",
		},
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = M.signs.Error,
				[vim.diagnostic.severity.WARN] = M.signs.Warn,
				[vim.diagnostic.severity.HINT] = M.signs.Hint,
				[vim.diagnostic.severity.INFO] = M.signs.Info,
			},
			linehl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
				[vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticNumberError",
				[vim.diagnostic.severity.WARN] = "DiagnosticNumberWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticNumberHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticNumberInfo",
			},
		},
	})
end

M.setup()

return M
