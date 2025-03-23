---@type LazySpec
return {
	enabled = true,
	"bluz71/vim-nightfly-colors",
	name = "nightfly",
	lazy = false,
	priority = 1000,
	config = function()
		-- local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
		-- local p = require("nightfly").palette
		-- vim.api.nvim_create_autocmd("ColorScheme", {
		-- 	pattern = "nightfly",
		-- 	callback = function()
		-- 		vim.api.nvim_set_hl(0, "Comment", { fg = p.grey_blue })
		-- 	end,
		-- 	group = custom_highlight,
		-- })
		vim.cmd.colorscheme("nightfly")
	end,
	init = function()
		vim.g.nightflyCursorColor = true
		vim.g.nightflyItalics = false
		vim.g.nightflyWinSeparator = 2
		vim.g.nightflyVirtualTextColor = true
		vim.g.nightflyUnderlineMatchParen = true
		-- vim.opt.fillchars = {
		-- 	horiz = "━",
		-- 	horizup = "┻",
		-- 	horizdown = "┳",
		-- 	vert = "┃",
		-- 	vertleft = "┫",
		-- 	vertright = "┣",
		-- 	verthoriz = "╋",
		-- }
	end,
}
