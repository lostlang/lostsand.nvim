local p = require("lostsand.palette")
local config = require("lostsand.config")
local terminal = require("lostsand.terminal")

local M = {}

local styles = vim.tbl_map(function(value)
	return setmetatable(value, {
		__add = function(a, b)
			return vim.tbl_extend("force", a, b)
		end,
	})
end, config.styles)

local function load_highlights(highlights)
	for group_name, group_settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group_name, group_settings)
	end
end

M.highlights = {
	Normal = { fg = p.black, bg = p.light_white },
	NormalFloat = { link = "Normal" },
	NormalNC = { link = "Normal" },
	Folded = { fg = p.black, bg = p.palette_light.g2 },
	SignColumn = { fg = p.black },
	Cursor = { reverse = true },
	CursorColumn = { bg = p.white },
	CursorLine = { link = "CursorColumn" },
	CursorLineNr = { fg = p.white },
	ColorColumn = { link = "CursorColumn" },
	LineNr = { fg = p.palette_dark.g2 },
	Directory = { fg = p.red },
	ErrorMsg = { fg = p.red, bold = true, underline = true },
	WarningMsg = { fg = p.orange, bold = true },
	MoreMsg = { fg = p.blue, bold = true },
	IncSearch = { fg = p.light_white, bg = p.red },
	Search = { fg = p.light_white, bg = p.green },
	CurSearch = { fg = p.light_white, bg = p.red },
	MatchParen = { fg = p.light_white, bg = p.palette_dark.g2 },
	NonText = { fg = p.palette_dark.g2 },
	Pmenu = { bg = p.light_white },
	PmenuSbar = { bg = p.white },
	PmenuSel = { bg = p.white },
	PmenuThumb = { bg = p.white },
	WildMenu = { fg = p.black, bg = p.white },
	Question = { fg = p.green },
	SpellBad = { fg = p.red, underline = true, sp = p.red },
	SpellCap = { fg = p.orange, underline = true, sp = p.orange },
	SpellLocal = { fg = p.blue, underline = true, sp = p.blue },
	SpellRare = { fg = p.purple, underline = true, sp = p.purple },
	StatusLine = { bg = p.palette_dark.g2 },
	StatusLineNC = { bg = p.palette_dark.g2 },
	TabLine = { bg = p.light_white },
	TabLineFill = { bg = p.light_white },
	TabLineSel = { fg = p.light_white, bg = p.red },
	WinSeparator = { fg = p.palette_dark.g2 },
	Visual = { bg = p.white },

	Type = { fg = p.aqua } + styles.keywords,
	Identifier = { fg = p.light_orange } + styles.identifiers,
	Constant = { fg = p.light_blue } + styles.variables,
	PreProc = { fg = p.red },
	Statement = { fg = p.red } + styles.keywords,
	Typedef = { fg = p.light_blue } + styles.keywords,
	Macro = { fg = p.purple },
	Error = { fg = p.red },
	Label = { fg = p.purple },
	Special = { fg = p.purple },
	Boolean = { fg = p.orange },
	String = { fg = p.blue },
	Number = { fg = p.light_blue },
	Function = { fg = p.green } + styles.functions,
	Title = { fg = p.blue },
	Comment = { fg = p.light_blue } + styles.comments,
	SpecialComment = { fg = p.light_blue } + styles.comments,
	Todo = { fg = p.blue } + styles.comments,

	-- lsp
	DiagnosticError = { fg = p.red },
	DiagnosticWarn = { fg = p.yellow },
	DiagnosticHint = { fg = p.aqua },
	DiagnosticInfo = { fg = p.blue },
	DiagnosticSignError = { fg = p.red },
	DiagnosticSignWarn = { fg = p.yellow },
	DiagnosticSignHint = { fg = p.aqua },
	DiagnosticSignInfo = { fg = p.blue },
	DiagnosticVirtualTextError = { fg = p.red },
	DiagnosticVirtualTextWarn = { fg = p.yellow },
	DiagnosticVirtualTextHint = { fg = p.aqua },
	DiagnosticVirtualTextInfo = { fg = p.blue },
	DiagnosticUnderlineError = { fg = p.red },
	DiagnosticUnderlineWarn = { fg = p.yellow },
	DiagnosticUnderlineHint = { fg = p.aqua },
	DiagnosticUnderlineInfo = { fg = p.blue },

	-- treesitter
	["@annotation"] = { link = "PreProc" },
	["@attribute"] = { link = "PreProc" },
	["@boolean"] = { link = "Boolean" },
	["@character"] = { link = "Character" },
	["@character.special"] = { link = "SpecialChar" },
	["@comment"] = { link = "Comment" },
	["@keyword.conditional"] = { link = "Conditional" },
	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { link = "Special" },
	["@constant.macro"] = { link = "Define" },
	["@keyword.debug"] = { link = "Debug" },
	["@keyword.directive.define"] = { link = "Define" },
	["@keyword.exception"] = { link = "Exception" },
	["@number.float"] = { link = "Float" },
	["@function"] = { link = "Function" },
	["@function.builtin"] = { link = "Special" },
	["@function.call"] = { link = "@function" },
	["@function.macro"] = { link = "Macro" },
	["@keyword.import"] = { link = "Include" },
	["@keyword.coroutine"] = { link = "@keyword" },
	["@keyword.operator"] = { link = "@operator" },
	["@keyword.return"] = { link = "@keyword" },
	["@function.method"] = { link = "Function" },
	["@function.method.call"] = { link = "@function.method" },
	["@namespace.builtin"] = { link = "@variable.builtin" },
	["@none"] = {},
	["@number"] = { link = "Number" },
	["@keyword.directive"] = { link = "PreProc" },
	["@keyword.repeat"] = { link = "Repeat" },
	["@keyword.storage"] = { link = "StorageClass" },
	["@string"] = { link = "String" },
	["@tag"] = { link = "Label" },
	["@tag.attribute"] = { link = "@property" },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@markup"] = { link = "@none" },
	["@markup.environment"] = { link = "Macro" },
	["@markup.environment.name"] = { link = "Type" },
	["@markup.raw"] = { link = "String" },
	["@markup.math"] = { link = "Special" },
	["@markup.strong"] = { bold = true },
	["@markup.emphasis"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.underline"] = { underline = true },
	["@markup.heading"] = { link = "Title" },
	["@comment.note"] = { fg = p.light_blue },
	["@comment.error"] = { fg = p.red },
	["@comment.hint"] = { fg = p.light_blue },
	["@comment.info"] = { fg = p.blue },
	["@comment.warning"] = { fg = p.light_orange },
	["@comment.todo"] = { fg = p.light_blue },
	["@markup.link.url"] = { link = "Underlined" },
	["@markup.link.label"] = { fg = p.light_blue },
	["@markup.link.label.symbol"] = { link = "@markup.link.label" },
	["@type"] = { link = "Type" },
	["@type.definition"] = { link = "Typedef" },
	["@type.qualifier"] = { link = "@keyword" },
	["@markup.list.unchecked"] = { fg = p.palette_dark.g3 },
	["@markup.list.checked"] = { fg = p.light_aqua },

	-- cmp
	CmpItemKindDefault = { fg = p.blue },
	CmpItemAbbrMatch = { fg = p.blue },
	CmpItemAbbrMatchFuzzy = { fg = p.blue },
	CmpItemKindKeyword = { fg = p.black },
	CmpItemKindVariable = { fg = p.light_blue },
	CmpItemKindConstant = { fg = p.light_blue },
	CmpItemKindReference = { fg = p.light_blue },
	CmpItemKindValue = { fg = p.light_blue },
	CmpItemKindFunction = { fg = p.aqua },
	CmpItemKindMethod = { fg = p.aqua },
	CmpItemKindConstructor = { fg = p.purple },
	CmpItemKindClass = { fg = p.light_purple },
	CmpItemKindInterface = { fg = p.light_purple },
	CmpItemKindStruct = { fg = p.light_purple },
	CmpItemKindEvent = { fg = p.light_purple },
	CmpItemKindEnum = { fg = p.light_purple },
	CmpItemKindUnit = { fg = p.light_purple },
	CmpItemKindModule = { fg = p.light_purple },
	CmpItemKindProperty = { fg = p.light_orange },
	CmpItemKindField = { fg = p.light_orange },
	CmpItemKindTypeParameter = { fg = p.light_orange },
	CmpItemKindEnumMember = { fg = p.light_orange },
	CmpItemKindOperator = { fg = p.light_orange },
	CmpItemKindSnippet = { fg = p.red },

	-- indent blankline
	IblScope = { fg = p.white },
	IblRed = { fg = p.light_red },
	IblGreen = { fg = p.light_green },
	IblYellow = { fg = p.light_yellow },
	IblBlue = { fg = p.light_blue },
	IblViolet = { fg = p.light_purple },
	IblCyan = { fg = p.light_aqua },
	IblOrange = { fg = p.light_orange },

	-- rainbow delimiters
	RainbowDelimiterRed = { fg = p.light_red },
	RainbowDelimiterGreen = { fg = p.light_green },
	RainbowDelimiterYellow = { fg = p.light_yellow },
	RainbowDelimiterBlue = { fg = p.light_blue },
	RainbowDelimiterViolet = { fg = p.light_purple },
	RainbowDelimiterCyan = { fg = p.light_aqua },
	RainbowDelimiterOrange = { fg = p.light_orange },

	-- diff
	DiffAdd = { fg = p.light_white, bg = p.blue },
	DiffChange = { fg = p.light_white, bg = p.light_orange },
	DiffText = { fg = p.light_white, bg = p.orange },

	-- gitsigns
	GitSignsAdd = { fg = p.aqua },
	GitSignsChange = { fg = p.blue },
	GitSignsDelete = { fg = p.red },
	GitSignsStageAdd = { fg = p.green },

	-- todo-comments
	TodoBgTODO = { fg = p.light_white, bg = p.blue },
	TodoFgTODO = { link = "Todo" },
	TodoSignTODO = { link = "TodoFgTODO" },
	TodoBgNOTE = { fg = p.light_white, bg = p.aqua },
	TodoFgNOTE = { fg = p.aqua },
	TodoSignNOTE = { link = "TodoFgNOTE" },
	TodoBgWARN = { fg = p.light_white, bg = p.yellow },
	TodoFgWARN = { fg = p.yellow },
	TodoSignWARN = { link = "TodoFgWARN" },
	TodoBgTEST = { fg = p.light_white, bg = p.light_orange },
	TodoFgTEST = { fg = p.light_orange },
	TodoSignTEST = { link = "TodoFgTEST" },
	TodoBgPERF = { fg = p.light_white, bg = p.purple },
	TodoFgPERF = { fg = p.purple },
	TodoSignPERF = { link = "TodoFgPERF" },
	TodoBgHACK = { fg = p.light_white, bg = p.light_green },
	TodoFgHACK = { fg = p.light_green },
	TodoSignHACK = { link = "TodoFgHACK" },
	TodoBgFIX = { fg = p.light_white, bg = p.red },
	TodoFgFIX = { fg = p.red },
	TodoSignFIX = { link = "TodoFgFIX" },

	-- neo-tree
	NeoTreeTitleBar = { fg = p.blue, bg = p.white },
	NeoTreeRootName = { fg = p.black, bold = true, italic = true },
	NeoTreeDimText = { link = "NeoTreeFileIcon" },
	NeoTreeMessage = { fg = p.palette_dark.g3 },
	NeoTreeDotfile = { link = "NeoTreeMessage" },
	NeoTreeFadeText1 = { fg = p.light_black },
	NeoTreeFadeText2 = { link = "NeoTreeFadeText1" },
	NeoTreeFileStatsHeader = { link = "NeoTreeFadeText1" },
	NeoTreeFileStats = { link = "NeoTreeFadeText1" },
	NeoTreeGitUntracked = { fg = p.aqua, italic = true },
	NeoTreeModified = { fg = p.blue },

	-- render-markdown
	RenderMarkdownCode = { bg = p.palette_dark.g0 },
	RenderMarkdownLink = { fg = p.light_blue },
	RenderMarkdownUncheckedText = { fg = p.palette_dark.g3 },
	RenderMarkdownDoneText = { fg = p.light_aqua, strikethrough = true },
	RenderMarkdownCustomCheckboxDrop = { fg = p.red },
	RenderMarkdownCustomCheckboxDropText = { fg = p.red, strikethrough = true },
	RenderMarkdownCustomCheckboxTest = { link = "TodoFgTEST" },
	RenderMarkdownCustomCheckboxTestText = { link = "RenderMarkdownCustomCheckboxTest" },
	RenderMarkdownCustomCheckboxActive = { link = "Todo" },
	RenderMarkdownCustomCheckboxActiveText = { link = "RenderMarkdownCustomCheckboxActive" },
	RenderMarkdownH1Bg = { fg = p.blue, bg = p.palette_dark.g0 },
	RenderMarkdownH2Bg = { link = "RenderMarkdownH1Bg" },
	RenderMarkdownH3Bg = { link = "RenderMarkdownH2Bg" },
	RenderMarkdownH4Bg = { link = "RenderMarkdownH3Bg" },
	RenderMarkdownH5Bg = { link = "RenderMarkdownH4Bg" },
	RenderMarkdownH6Bg = { link = "RenderMarkdownH5Bg" },
}

function M.setup()
	load_highlights(M.highlights)
	terminal.setup()
end

return M
