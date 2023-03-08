local M = { vi = {} }

M.vi.text = {
	n = "NORMAL",
	no = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	[""] = "V-BLOCK",
	c = "COMMAND",
	cv = "COMMAND",
	ce = "COMMAND",
	R = "REPLACE",
	Rv = "REPLACE",
	s = "SELECT",
	S = "SELECT",
	t = "TERMINAL",
}
M.colors = {
	bg = "#282c34",
	cyan = "#008080",
	darkblue = "#081633",
	darkblue2 = "#2c82b8",
	magenta = "#d16d9e",
	blue = "#71ace7",
	white = "#FFFFFF",
	black = "#272822",
	lightblack = "#2D2E27",
	lightblack2 = "#383a3e",
	arkblack = "#211F1C",
	grey = "#8F908A",
	lightgrey = "#575b61",
	darkgrey = "#64645e",
	warmgrey = "#75715E",
	pink = "#F93C80",
	green = "#84F57D",
	darkgreen = "#a1c181",
	aqua = "#66d9ef",
	darkaqua = "#4EADE5",
	yellow = "#FFFF43",
	orange = "#FFBD37",
	deepOrange = "#FF8C00",
	purple = "#ae81ff",
	darkpurple = "#855dcf",
	red = "#FF1919",
	darkred = "#F44747",
	addfg = "#d7ffaf",
	addbg = "#5f875f",
	delbg = "#f75f5f",
	changefg = "#d7d7ff",
	changebg = "#5f5f87",
}

-- M.icons = {
-- 	locker = "", -- #f023
-- 	page = "☰", -- 2630
-- 	line_number = "", -- e0a1
-- 	connected = "", -- f817
-- 	dos = "", -- e70f
-- 	unix = "", -- f17c
-- 	mac = "", -- f179
-- 	mathematical_L = "𝑳",
-- 	vertical_bar = "┃",
-- 	vertical_bar_thin = "│",
-- 	left = "",
-- 	right = "",
-- 	block = "█",
-- 	left_filled = "",
-- 	right_filled = "",
-- 	slant_left = "",
-- 	slant_left_thin = "",
-- 	slant_right = "",
-- 	slant_right_thin = "",
-- 	slant_left_2 = "",
-- 	slant_left_2_thin = "",
-- 	slant_right_2 = "",
-- 	slant_right_2_thin = "",
-- 	left_rounded = "",
-- 	left_rounded_thin = "",
-- 	right_rounded = "",
-- 	right_rounded_thin = "",
-- 	circle = "●",
-- }

return M
