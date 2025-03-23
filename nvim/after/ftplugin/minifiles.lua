---@module "mini.files"
vim.keymap.set("n", "<Esc>", function()
	MiniFiles.close()
end, { buffer = true })
