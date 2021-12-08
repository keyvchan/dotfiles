CommandLineWindow = function()
	local width = 50
	local height = 3

	local buf = vim.api.nvim_create_buf(false, false)

	local ui = vim.api.nvim_list_uis()[0]

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = width,
		col = height,
		winid = ui,
		style = "minimal",
		border = "rounded",
	})

	vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, { ">   " })
	vim.api.nvim_win_set_cursor(win, { 1, 3 })
	vim.cmd("startinsert")

	local obline_cb = function(_, buff, changedtick, firstline, lastline, new_lastline, bytecount)
		local cur_lines = vim.api.nvim_buf_get_lines(buff, firstline, new_lastline, true)
		print(lastline, new_lastline)
		if lastline ~= new_lastline then
			local win = vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = width,
				height = height,
				row = width,
				col = height,
				winid = ui,
				style = "minimal",
				border = "rounded",
			})

			return true
		end
	end
	local ondetach_cb = function()
		vim.api.nvim_win_close(win, true)
	end
	-- when the user presses enter, we should close the window
	vim.api.nvim_buf_attach(buf, false, {
		on_lines = obline_cb,
		on_detach = ondetach_cb,
	})
end
