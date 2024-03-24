local palette_gray_light = {
	g0 = "#fefae7",
	g1 = "#eddfbf",
	g2 = "#c9bdad",
	g3 = "#a69b9c",
	g4 = "#83798b",
	g5 = "#60577a",
	g6 = "#393b65",
}

local palette_gray_dark = {
	g0 = "#ead58f",
	g1 = "#cdb479",
	g2 = "#a48f6d",
	g3 = "#7c6b61",
	g4 = "#544655",
	g5 = "#2c2249",
	g6 = "#0c1c31",
}

local palette = {
	palette_light = palette_gray_light,
	palette_dark = palette_gray_dark,
	light_white = palette_gray_light.g1,
	light_red = "#a63f42",
	light_orange = "#bf6f40",
	light_yellow = "#a68d3f",
	light_green = "#73a73f",
	light_aqua = "#3fa66f",
	light_blue = "#3f69a6",
	light_purple = "#a63f8c",
	light_black = palette_gray_light.g5,
	white = palette_gray_dark.g1,
	red = "#97070c",
	orange = "#973d07",
	yellow = "#977407",
	green = "#437f06",
	aqua = "#07974a",
	blue = "#074297",
	purple = "#970771",
	black = palette_gray_dark.g5,
	none = "NONE",
}

return palette
