local treesitter = require("nvim-treesitter")
local group = vim.api.nvim_create_augroup("DotfilesTreesitter", { clear = true })

local function start_parsers()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			pcall(vim.treesitter.start, bufnr)
		end
	end
end

local function install_missing_parsers()
	local installed = {}
	for _, parser in ipairs(treesitter.get_installed()) do
		installed[parser] = true
	end

	local missing = vim.tbl_filter(function(parser)
		return not installed[parser]
	end, treesitter.get_available())

	if #missing == 0 then
		return
	end

	local task = treesitter.install(missing, { summary = true })
	task:await(function(err, success)
		if not err and success then
			start_parsers()
		end
	end)
	task:raise_on_error()
end

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(event)
		pcall(vim.treesitter.start, event.buf)
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	group = group,
	callback = function(event)
		local data = event.data or {}
		local spec = data.spec or {}
		if spec.name ~= "nvim-treesitter" or data.kind ~= "update" then
			return
		end

		vim.schedule(function()
			treesitter.update(nil, { summary = true }):raise_on_error()
		end)
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	once = true,
	callback = function()
		vim.schedule(install_missing_parsers)
	end,
})
