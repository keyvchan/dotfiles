return {
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	filetypes = { "c", "cpp" },
	root_dir = function()
		return vim.fn.getcwd()
	end,
}
