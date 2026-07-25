vim.lsp.inlay_hint.enable()

local on_type_formatters = {
	rust_analyzer = true,
}

local function configure_on_type_formatting(client)
	if on_type_formatters[client.name] then
		vim.lsp.on_type_formatting.enable(true, { client_id = client.id })
	end
end

vim.lsp.on_type_formatting.enable(false)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("DotfilesLspFormatting", { clear = true }),
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
		configure_on_type_formatting(client)
	end,
})

for _, client in ipairs(vim.lsp.get_clients()) do
	configure_on_type_formatting(client)
end

require("configs.lsp.server")
require("configs.lsp.keymap")
require("configs.lsp.diagnostic")
