---@type LazySpec
return {
	enabled = false,
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	init = function()
		-- Lua initialization file
		vim.g.moonflyItalics = false
	end,
	lazy = false,
	priority = 1000,
	config = function() end,
}
