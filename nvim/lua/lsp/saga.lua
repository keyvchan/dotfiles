local saga = require("lspsaga")

saga.setup({
	use_saga_diagnostic_sign = false,
	code_action_prompt = {
		enable = false,
	},
	max_preview_lines = 10,
	border_style = "single",
})
