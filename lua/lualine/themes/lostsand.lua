local p = require("lostsand.palette")

local lostsand = {
	normal = {
		a = { bg = p.red, fg = p.light_white },
		b = { bg = p.palette_dark.g2, fg = p.light_white },
		c = { bg = p.light_white, fg = p.black },
	},
	insert = {
		a = { bg = p.blue, fg = p.light_white },
	},
	visual = {
		a = { bg = p.purple, fg = p.light_white },
	},
	replace = {
		a = { bg = p.red, fg = p.light_white },
	},
	command = {
		a = { bg = p.aqua, fg = p.light_white },
	},
	terminal = {
		a = { bg = p.light_blue, fg = p.light_white },
	},
	inactive = {
		a = { bg = p.light_white, fg = p.light_black },
		b = { bg = p.light_white, fg = p.light_black },
		c = { bg = p.light_white, fg = p.light_black },
	},
}

return lostsand
