local M = {}

function M._load()
	vim.cmd([[hi clear]])

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.o.background = "light"
	vim.g.colors_name = "lostsand"
	require("lostsand.highlights").setup()
end

M.setup = require("lostsand.config").setup

return M
