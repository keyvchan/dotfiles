local M = {}

M.file_readonly = function()
	if vim.bo.filetype == "help" then
		return true
	end
	return vim.bo.readonly
end

M.file_with_icons = function(file, modified_icon, readonly_icon)
	if vim.fn.empty(file) == 1 then
		return ""
	end

	modified_icon = modified_icon or ""
	readonly_icon = readonly_icon or ""

	-- if M.file_readonly() then
	-- 	file = readonly_icon .. " " .. file
	-- end

	if vim.bo.modifiable and vim.bo.modified then
		file = file .. " " .. modified_icon
	end

	return file
end

M.file_icon = function(file)
	-- apply icon based on filetype
	local icon = require("nvim-web-devicons").get_icon(file)
	return icon
end

M.get_base_file_name = function()
	local win_id = vim.fn.win_getid()
	local buf_nr = vim.fn.winbufnr(win_id)
	local buf_name = vim.fn.bufname(buf_nr)
	local base_name = vim.fn.fnamemodify(buf_name, [[:~:.]])

	return base_name
end

M.get_space = function()
	local win_id = vim.fn.win_getid()
	local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(win_id)))
	return space
end

M.filename = function()
	local base_name = M.get_base_file_name()
	local space = M.get_space()

	if string.len(base_name) <= space then
		return M.file_with_icons(base_name) .. " "
	else
		return M.file_with_icons(vim.fn.pathshorten(base_name)) .. " "
	end
end

return M
