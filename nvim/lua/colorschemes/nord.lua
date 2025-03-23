---@type LazySpec
return {
	enabled = false,
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		-- Example config in lua
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_cursorline_transparent = false
		vim.g.nord_enabled_sidebar_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = false
		vim.g.nord_bold = false

		-- Load the colorscheme
		require("nord").set()
	end,
	config = function()
		vim.cmd.colorscheme("nord")
	end,
}
