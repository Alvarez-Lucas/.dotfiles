---@type LazySpec
return {
	enabled = false,
	"p00f/alabaster.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("alabaster")
	end,
}
