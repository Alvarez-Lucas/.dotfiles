return {
	enabled = true,
	"bluz71/vim-nightfly-colors",
	name = "nightfly",
	lazy = false,
	priority = 1000,
	config = function()
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
