---@type LazySpec
return {
	enabled = false,
	"chiendo97/intellij.vim",
	config = function()
		vim.cmd.colorscheme("intellij")
	end,
}
