local M = {}
local conditions = require("heirline.conditions")
local u = require("plugins.statusline.utils.colors")

M.diagnostics = {

	condition = conditions.has_diagnostics,

	static = {
		error_icon = "\u{2717}" .. " ",
		warn_icon = "\u{f071}" .. " ",
		info_icon = "\u{fbe7}" .. " ",
		hint_icon = "\u{f449}" .. " ",
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },

	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = u.colors.black, bg = u.colors.purple },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = u.colors.black, bg = u.colors.purple },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. " ")
		end,
		hl = { fg = u.colors.black, bg = u.colors.purple },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints .. " ")
		end,
		hl = { fg = u.colors.black, bg = u.colors.purple },
	},
}

M.progress = {
	update = {
		"User",
		pattern = "LspProgressStatusUpdated",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
	{
		provider = function()
			return " "
		end,
		hl = {
			fg = u.colors.purple,
			bg = u.colors.purple,
		},
	},
	{
		provider = require("lsp-progress").progress,
		hl = { fg = u.colors.black, bg = u.colors.purple },
	},
	{
		provider = function()
			return " "
		end,
		hl = {
			fg = u.colors.purple,
			bg = u.colors.purple,
		},
	},
}
return M
