---@type LazySpec
return {
	enabled = false,
	"Yazeed1s/oh-lucy.nvim",
	init = function()
		vim.g.oh_lucy_italic_comments = false
		vim.g.oh_lucy_italic_keywords = true
		vim.g.oh_lucy_italic_booleans = false
		vim.g.oh_lucy_italic_functions = false
		vim.g.oh_lucy_italic_variables = true
		vim.g.oh_lucy_transparent_background = false
	end,
	config = function()
		vim.cmd.colorscheme("oh-lucy-evening")
	end,
}
