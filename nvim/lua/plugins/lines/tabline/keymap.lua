-- set keymap
vim.keymap.set({ "n", "i" }, "<C-Tab>", function()
	local tabline = require("heirline").tabline
	local buflist = tabline._buflist[1]

	-- loop the buflist
	for i, v in ipairs(buflist) do
		-- get the current buffer number
		if v.bufnr == vim.api.nvim_get_current_buf() then
			-- get the next buffer number
			local next = buflist[i + 1]
			if next ~= nil and next.bufnr ~= nil then
				vim.api.nvim_set_current_buf(next.bufnr)
			else
				vim.api.nvim_set_current_buf(buflist[1].bufnr)
			end
			break
		end
	end
end)
