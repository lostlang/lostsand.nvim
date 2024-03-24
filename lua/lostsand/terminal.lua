local M = {}
local p = require("lostsand.palette")

function M.setup()
	vim.g.terminal_color_0 = p.black
	vim.g.terminal_color_8 = p.light_black

	vim.g.terminal_color_7 = p.white
	vim.g.terminal_color_15 = p.light_white

	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_9 = p.light_red

	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_10 = p.light_green

	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_11 = p.light_yellow

	vim.g.terminal_color_4 = p.blue
	vim.g.terminal_color_12 = p.light_blue

	vim.g.terminal_color_5 = p.purple
	vim.g.terminal_color_13 = p.light_purple

	vim.g.terminal_color_6 = p.aqua
	vim.g.terminal_color_14 = p.light_aqua
end

return M
