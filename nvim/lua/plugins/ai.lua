require("codecompanion").setup({
	opts = {
		log_level = "DEBUG", -- or "TRACE"
	},
	interactions = {
		chat = {
			adapter = "gemini_cli",
		},
	},
	adapters = {
		acp = {
			gemini_cli = function()
				return require("codecompanion.adapters").extend("gemini_cli", {
					defaults = {
						auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
					},
				})
			end,
		},
	},
})
