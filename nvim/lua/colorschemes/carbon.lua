---@type LazySpec
return {
	enabled = false,
	"nyoom-engineering/oxocarbon.nvim",
	config = function()
		vim.cmd.colorscheme("oxocarbon")
	end,
}
