---@module "mini.files"
vim.keymap.set("n", "<Esc>", function()
	MiniFiles.close()
end, { buffer = true })

vim.keymap.set("n", "J", "j", { buffer = true })
vim.keymap.set("n", "K", "k", { buffer = true })
vim.keymap.set("n", "<cr>", "J", { buffer = true })
