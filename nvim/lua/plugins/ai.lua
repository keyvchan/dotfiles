require("minuet").setup({
	virtualtext = {
		auto_trigger_ft = {
			"*",
		},
		keymap = {
			accept = "<C-e>",
			accept_line = "<C-a>",
			accept_n_lines = "<C-z>",
			prev = "<A-]>",
			next = "<A-[>",
			dismiss = "<C-d>",
		},
	},
	provider = "gemini",
	provider_options = {
		gemini = {
			model = "gemini-2.0-flash",
			stream = true,
			api_key = "GEMINI_API_KEY",
			end_point = "https://generativelanguage.googleapis.com/v1beta/models",
			optional = {
				generationConfig = {
					maxOutputTokens = 256,
					-- When using `gemini-2.5-flash`, it is recommended to entirely
					-- disable thinking for faster completion retrieval.
					thinkingConfig = {
						thinkingBudget = 0,
					},
				},
				safetySettings = {
					{
						-- HARM_CATEGORY_HATE_SPEECH,
						-- HARM_CATEGORY_HARASSMENT
						-- HARM_CATEGORY_SEXUALLY_EXPLICIT
						category = "HARM_CATEGORY_DANGEROUS_CONTENT",
						-- BLOCK_NONE
						threshold = "BLOCK_ONLY_HIGH",
					},
				},
			},
		},
	},
})
