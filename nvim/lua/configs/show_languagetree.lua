local M = {}
local ts = vim.treesitter
local languagetree = require("vim.treesitter.languagetree")

function ShowLangTree()
	local lan_tree = languagetree.new(0, vim.bo.filetype, {})
	vim.notify(vim.inspect(lan_tree))
	-- langtree = langtree or ts.get_parser()
	-- indent = indent or ""

	-- print(indent .. langtree:lang())
	-- for _, region in pairs(langtree:included_regions()) do
	-- 	if type(region[1]) == "table" then
	-- 		print(indent .. "  " .. vim.inspect(region))
	-- 	else
	-- 		print(indent .. "  " .. vim.inspect({ region[1]:range() }))
	-- 	end
	-- end
	-- for lang, child in pairs(langtree._children) do
	-- 	ShowLangTree(child, indent .. "  ")
	-- end
end

return M
