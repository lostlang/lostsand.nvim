local palette_gray_light = {
	g0 = "#F9F0D2",
	g1 = "#EDDFBF",
	g2 = "#D4B979",
	g3 = "#B98D56",
	g4 = "#8C5A3E",
	g5 = "#25373A",
	g6 = "#0A1A1D",
}

local palette_gray_dark = {
	g0 = "#E6D1A3",
	g1 = "#DAB97C",
	g2 = "#A78A5E",
	g3 = "#8C6A46",
	g4 = "#5D3A39",
	g5 = "#10072B",
	g6 = "#0B0014",
}

local palette = {
	palette_light = palette_gray_light,
	palette_dark = palette_gray_dark,
	light_white = palette_gray_light.g1,
	light_red = "#E26F6F",
	light_orange = "#EA7742",
	light_yellow = "#E1BA3F",
	light_green = "#92C654",
	light_aqua = "#49AB77",
	light_blue = "#257DC7",
	light_purple = "#B47CC0",
	light_black = palette_gray_light.g5,
	white = palette_gray_dark.g1,
	red = "#AE2626",
	orange = "#A8460B",
	yellow = "#9B8318",
	green = "#437F06",
	aqua = "#0B8C5F",
	blue = "#23569F",
	purple = "#991294",
	black = palette_gray_dark.g5,
	none = "NONE",
}

return palette
