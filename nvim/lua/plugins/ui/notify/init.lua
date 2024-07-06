local M = {
	"rcarriga/nvim-notify",

	lazy = false,
}

function M.config()
	require("notify").setup({
		background_colour = "#000000",
		timeout = 5000,
		fps = 60,
	})

	vim.api.nvim_create_autocmd({ "UIEnter" }, {
		once = true,
		callback = function()
			local Spinner = require("plugins.ui.notify.spinner")
			local spinners = {}

			local function format_msg(msg, percentage)
				msg = msg or ""
				if not percentage then
					return msg
				end
				return ("%2d%%\t%s"):format(percentage, msg)
			end

			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = { "LspProgressUpdate" },
				group = vim.api.nvim_create_augroup("LSPNotify", { clear = true }),
				desc = "LSP progress notifications",
				callback = function()
					-- TODO: use one spinner for all tokens of each client
					for _, c in ipairs(vim.lsp.get_clients()) do
						for token, ctx in pairs(c.messages.progress) do
							if not spinners[c.id] then
								spinners[c.id] = {}
							end
							local s = spinners[c.id][token]
							if not ctx.done then
								if not s then
									spinners[c.id][token] =
										Spinner(format_msg(ctx.message, ctx.percentage), vim.log.levels.INFO, {
											title = ctx.title and ("%s: %s"):format(c.name, ctx.title) or c.name,
										})
								else
									s:update(format_msg(ctx.message, ctx.percentage))
								end
							else
								c.messages.progress[token] = nil
								if s then
									s:done(ctx.message or "Complete", nil, {
										icon = "",
									})
									spinners[c.id][token] = nil
								end
							end
						end
					end
				end,
			})
		end,
	})
	vim.notify = require("notify")
end

return M
