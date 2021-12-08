local signature_help = require("lsp_signature")

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- Use a sharp border with `FloatBorder` highlights
	border = "single",
})

signature_help.on_attach({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
	floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
	floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = true, -- virtual hint enable
	hint_prefix = "\u{27a5} ", -- Panda for parameter
	hint_scheme = "String",
	use_lspsaga = false, -- set to true if you want to use lspsaga popup
	hi_parameter = "Search", -- how your parameter will be highlight
	max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
	-- to view the hiding contents
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	transpancy = 10, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
	handler_opts = {
		border = "shadow", -- double, single, shadow, none
	},

	trigger_on_newline = false, -- set to true if you need multiple line parameter, sometime show signature on new line can be confusing, set it to false for #58
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
	debug = false, -- set to true to enable debug logging
	log_path = "debug_log_file_path", -- debug log path
	padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
	shadow_blend = 36, -- if you using shadow as border use this set the opacity
	shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
})
